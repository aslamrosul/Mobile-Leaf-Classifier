import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import 'constants.dart';
import 'splash_screen.dart';
import 'audio_service.dart';
import 'achievement_notification.dart';

void main() {
  runApp(const MyApp());
}

class AppRoot extends StatefulWidget {
  final String apiBase;
  
  const AppRoot({super.key, required this.apiBase});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  void initState() {
    super.initState();
    debugPrint('🌿 AppRoot initState - Starting timer');
    // Navigate to home after splash
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint('🌿 Timer completed - mounted: $mounted');
      if (mounted) {
        debugPrint('🌿 Navigating to HomePage');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(apiBase: widget.apiBase),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🌿 AppRoot build - Showing SplashScreen');
    return SplashScreen(
      onComplete: () {
        debugPrint('🌿 SplashScreen onComplete called - mounted: $mounted');
        if (mounted) {
          debugPrint('🌿 Navigating to HomePage from callback');
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(apiBase: widget.apiBase),
            ),
          );
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  static const String apiBase = "http://192.168.75.27:5000";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🌿 Leaf Explorer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          primary: AppColors.primaryGreen,
          secondary: AppColors.secondaryGreen,
        ),
        useMaterial3: true,
      ),
      home: const AppRoot(apiBase: apiBase),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  final String apiBase;
  const HomePage({super.key, required this.apiBase});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  XFile? _imageFile;
  Uint8List? _webImage;
  bool _loading = false;
  String? _prediction;
  String selectedModel = "hayyin";
  int _totalScans = 0;
  int _currentPage = 0;
  
  final ImagePicker _picker = ImagePicker();
  final PageController _pageController = PageController();
  late ConfettiController _confettiController;
  late AnimationController _leafAnimController;

  @override
  void initState() {
    super.initState();
    _loadStats();
    AudioService.initialize(); // Initialize TTS
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));
    _leafAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _leafAnimController.dispose();
    _pageController.dispose();
    AudioService.dispose();
    super.dispose();
  }

  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _totalScans = prefs.getInt('total_scans') ?? 0;
    });
  }

  Future<void> _saveStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('total_scans', _totalScans);
  }

  Future<void> _pickImage(ImageSource src) async {
    try {
      final picked = await _picker.pickImage(source: src, imageQuality: 85);
      if (picked == null) return;

      if (kIsWeb) {
        final bytes = await picked.readAsBytes();
        setState(() {
          _webImage = bytes;
          _imageFile = picked;
        });
      } else {
        setState(() {
          _imageFile = picked;
        });
      }

      setState(() {
        _prediction = null;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal memilih gambar")),
        );
      }
    }
  }

  Future<void> _uploadAndPredict() async {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pilih gambar dulu")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      final endpoint = selectedModel == "hayyin" ? "/predict_hayyin" : "/predict_naufal";
      final uri = Uri.parse("${widget.apiBase}$endpoint");
      final request = http.MultipartRequest('POST', uri);

      if (kIsWeb) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            _webImage!,
            filename: "upload.png",
            contentType: MediaType("image", "png"),
          ),
        );
      } else {
        final file = File(_imageFile!.path);
        final mimeType = lookupMimeType(file.path) ?? 'image/jpeg';
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            file.path,
            filename: path.basename(file.path),
            contentType: _mediaTypeFromMime(mimeType),
          ),
        );
      }

      final streamed = await request.send();
      final response = await http.Response.fromStream(streamed);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final oldScans = _totalScans;
        setState(() {
          _prediction = body['prediction']?.toString();
          _totalScans++;
        });
        _saveStats();
        _confettiController.play();
        
        // Play success sound
        AudioService.playSuccessSound();
        
        // Speak leaf name
        if (_prediction != null) {
          final info = LeafInfo.getInfo(_prediction!);
          AudioService.speakLeafInfo(_prediction!, info['fact']!);
        }
        
        // Check for new achievements
        _checkAndShowAchievement(oldScans, _totalScans);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Server Error ${response.statusCode}")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Gagal terhubung ke server")),
        );
      }
    }

    setState(() => _loading = false);
  }

  MediaType _mediaTypeFromMime(String mime) {
    final parts = mime.split('/');
    return MediaType(parts[0], parts[1]);
  }

  void _checkAndShowAchievement(int oldScans, int newScans) {
    final achievements = AchievementData.getAchievements();
    
    for (final achievement in achievements) {
      final target = achievement['target'] as int;
      // Check if just unlocked this achievement
      if (oldScans < target && newScans >= target) {
        // Show notification
        if (mounted) {
          showAchievementNotification(
            context,
            emoji: achievement['emoji'],
            title: achievement['title'],
            description: achievement['description'],
          );
          
          // Play achievement sound
          AudioService.playAchievementSound();
          
          // Speak achievement
          AudioService.speakAchievement(achievement['title']);
        }
        break; // Only show one achievement at a time
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentPage = index),
        children: [
          _buildMainPage(),
          _buildLearnPage(),
          _buildAchievementsPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Belajar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Prestasi',
          ),
        ],
      ),
    );
  }

  Widget _buildMainPage() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE8F5E9),
                Colors.white,
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildImagePreview(),
                        const SizedBox(height: 20),
                        if (_prediction != null) _buildPredictionCard(),
                        const SizedBox(height: 20),
                        _buildModelSelector(),
                        const SizedBox(height: 20),
                        _buildActionButtons(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            colors: const [
              Color(0xFF2E7D32),
              Color(0xFF66BB6A),
              Color(0xFF81C784),
              Color(0xFFA5D6A7),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2E7D32),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🌿 Leaf Explorer',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Jelajahi Dunia Daun!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.eco, color: Colors.white, size: 20),
                    const SizedBox(width: 5),
                    Text(
                      '$_totalScans',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0);
  }

  Widget _buildImagePreview() {
    final hasImage = _imageFile != null;
    
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2E7D32).withValues(alpha: 0.3),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: hasImage
            ? Container(
                color: const Color(0xFFF5F5F5), // Background abu-abu muda
                child: Center(
                  child: kIsWeb
                      ? Image.memory(
                          _webImage!,
                          fit: BoxFit.contain,
                        )
                      : Image.file(
                          File(_imageFile!.path),
                          fit: BoxFit.contain,
                        ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _leafAnimController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _leafAnimController.value * 0.1,
                          child: Icon(
                            Icons.eco,
                            size: 80,
                            color: const Color(0xFF2E7D32).withValues(alpha: 0.3),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Pilih Gambar Daun',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ).animate().scale(duration: 500.ms, curve: Curves.easeOut);
  }

  Widget _buildPredictionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 50),
          const SizedBox(height: 10),
          const Text(
            'Hasil Identifikasi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _prediction!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          _buildLeafInfo(_prediction!),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms);
  }

  Widget _buildLeafInfo(String leafName) {
    final info = LeafInfo.getInfo(leafName);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                info['emoji']!,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(width: 10),
              // Play audio button
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 30),
                onPressed: () {
                  AudioService.speakLeafInfo(leafName, info['fact']!);
                },
                tooltip: 'Dengarkan info daun',
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Bentuk daun
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  info['shapeIcon']!,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 5),
                Text(
                  'Bentuk: ${LeafInfo.getShapeName(info['shape']!)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            info['fact']!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildModelSelector() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF2E7D32).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.psychology, color: Color(0xFF2E7D32)),
              SizedBox(width: 10),
              Text(
                'Model AI:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: selectedModel,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(
                  value: "hayyin",
                  child: Text("🧠 Model Hayyin"),
                ),
                DropdownMenuItem(
                  value: "naufal",
                  child: Text("🧠 Model Naufal"),
                ),
              ],
              onChanged: (val) {
                setState(() {
                  selectedModel = val!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildButton(
                icon: Icons.photo_camera,
                label: 'Kamera',
                color: const Color(0xFF2E7D32),
                onPressed: () => _pickImage(ImageSource.camera),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildButton(
                icon: Icons.photo_library,
                label: 'Galeri',
                color: const Color(0xFF66BB6A),
                onPressed: () => _pickImage(ImageSource.gallery),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        _buildButton(
          icon: _loading ? Icons.hourglass_empty : Icons.search,
          label: _loading ? 'Menganalisis...' : 'Identifikasi Daun',
          color: const Color(0xFF1B5E20),
          onPressed: _loading ? null : _uploadAndPredict,
          isLoading: _loading,
        ),
      ],
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          else
            Icon(icon, size: 24),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnPage() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE8F5E9), Colors.white],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.school, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Belajar Tentang Daun',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: LearnData.getLessons().length,
                itemBuilder: (context, index) {
                  final lesson = LearnData.getLessons()[index];
                  return _buildLearnCard(
                    '${lesson['emoji']} ${lesson['title']}',
                    lesson['description'],
                    lesson['color'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnCard(String title, String description, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF2E7D32).withValues(alpha: 0.2),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B5E20),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2E7D32),
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1, end: 0);
  }

  Widget _buildAchievementsPage() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE8F5E9), Colors.white],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF2E7D32),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.emoji_events, color: Colors.white, size: 30),
                  SizedBox(width: 10),
                  Text(
                    'Prestasi Kamu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: AchievementData.getAchievements().length,
                itemBuilder: (context, index) {
                  final achievement = AchievementData.getAchievements()[index];
                  return _buildAchievementCard(
                    '${achievement['emoji']} ${achievement['title']}',
                    achievement['description'],
                    _totalScans >= achievement['target'],
                    achievement['target'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(String title, String description, bool unlocked, int target) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: unlocked ? const Color(0xFF66BB6A) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: unlocked
              ? const Color(0xFF2E7D32)
              : Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: unlocked ? Colors.white : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Text(
              title.split(' ')[0],
              style: const TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: unlocked ? Colors.white : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: unlocked ? Colors.white : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (_totalScans / target).clamp(0.0, 1.0),
                  backgroundColor: unlocked
                      ? Colors.white.withValues(alpha: 0.3)
                      : Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    unlocked ? Colors.white : const Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
          ),
          if (unlocked)
            const Icon(Icons.check_circle, color: Colors.white, size: 30),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).scale(delay: 100.ms);
  }
}
