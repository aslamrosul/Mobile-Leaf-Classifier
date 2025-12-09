import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;
  
  const SplashScreen({super.key, required this.onComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    debugPrint('🌿 SplashScreen initState');
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    
    // Navigate after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint('🌿 SplashScreen timer completed - mounted: $mounted');
      if (mounted) {
        debugPrint('🌿 Calling onComplete callback');
        widget.onComplete();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryGreen,
              AppColors.secondaryGreen,
              AppColors.lightGreen,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Leaf Icon
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_controller.value * 0.2),
                    child: Transform.rotate(
                      angle: _controller.value * 0.2,
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.eco,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 40),
              
              // App Title
              const Text(
                '🌿 Leaf Explorer',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate()
                .fadeIn(duration: 800.ms)
                .slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 15),
              
              // Subtitle
              const Text(
                'Jelajahi Dunia Daun!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ).animate()
                .fadeIn(delay: 400.ms, duration: 800.ms)
                .slideY(begin: 0.3, end: 0),
              
              const SizedBox(height: 60),
              
              // Loading Indicator
              const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ).animate()
                .fadeIn(delay: 800.ms),
              
              const SizedBox(height: 20),
              
              // Fun Fact
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  FunFacts.getRandomFact(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ).animate()
                .fadeIn(delay: 1200.ms, duration: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}
