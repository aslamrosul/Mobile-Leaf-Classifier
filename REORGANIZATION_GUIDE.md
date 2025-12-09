# 🔄 Panduan Reorganisasi Kode

## 📋 Daftar File yang Perlu Dipindahkan

### Dari `lib/` ke struktur baru:

| File Lama | File Baru | Lokasi |
|-----------|-----------|--------|
| `constants.dart` | Dipecah menjadi beberapa file | `core/constants/` |
| `audio_service.dart` | `audio_service.dart` | `shared/services/` |
| `achievement_notification.dart` | `achievement_notification.dart` | `shared/widgets/` |
| `splash_screen.dart` | `splash_screen.dart` | `features/splash/` |
| `main.dart` | Dipecah menjadi beberapa file | `features/scan/` |

---

## 🎯 Langkah-Langkah Reorganisasi

### Step 1: Pecah `constants.dart`

**File lama:** `lib/constants.dart` (1 file besar)

**File baru:**
```
core/constants/
├── app_colors.dart          # Warna
├── app_constants.dart       # Konstanta umum
└── data/
    ├── leaf_data.dart       # Data daun
    ├── achievement_data.dart # Data achievement
    ├── learn_data.dart      # Data pembelajaran
    └── fun_facts.dart       # Fun facts
```

#### 1.1 Create `core/constants/app_colors.dart`

```dart
/// App Colors
/// 
/// Warna-warna yang digunakan di seluruh aplikasi.
/// Tema: Hijau-Putih Profesional
/// 
/// Author: [Nama Anggota 1]
/// Date: December 9, 2024

import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color secondaryGreen = Color(0xFF66BB6A);
  static const Color lightGreen = Color(0xFF81C784);
  static const Color paleGreen = Color(0xFFA5D6A7);
  static const Color backgroundGreen = Color(0xFFE8F5E9);
  
  // Dark Greens
  static const Color darkGreen = Color(0xFF1B5E20);
  static const Color forestGreen = Color(0xFF388E3C);
  
  // Neutral Colors
  static const Color white = Colors.white;
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color mediumGray = Color(0xFFBDBDBD);
  static const Color darkGray = Color(0xFF616161);
  
  // Accent Colors
  static const Color orange = Color(0xFFFF9800);
  static const Color yellow = Color(0xFFFFC107);
  static const Color blue = Color(0xFF2196F3);
}
```

#### 1.2 Create `core/constants/app_constants.dart`

```dart
/// App Constants
/// 
/// Konstanta global aplikasi.
/// 
/// Author: [Nama Anggota 1]
/// Date: December 9, 2024

class AppConstants {
  // API
  static const String apiBaseUrl = "http://192.168.68.241:5000";
  static const String predictHayyinEndpoint = "/predict_hayyin";
  static const String predictNaufalEndpoint = "/predict_naufal";
  
  // Storage Keys
  static const String totalScansKey = 'total_scans';
  
  // App Info
  static const String appName = 'Leaf Explorer';
  static const String appVersion = '2.0.0';
}

/// Bentuk daun
enum LeafShape {
  menjari,    // Seperti jari tangan (pepaya, singkong)
  sejajar,    // Tulang daun sejajar (pisang, padi)
  melengkung, // Tulang daun melengkung (mangga, jambu)
  menyirip,   // Tulang daun menyirip (nangka, asam)
}
```

#### 1.3 Create `core/constants/data/leaf_data.dart`

```dart
/// Leaf Data
/// 
/// Data informasi tentang berbagai jenis daun.
/// 
/// Author: [Nama Anggota 1]
/// Date: December 9, 2024

class LeafData {
  static Map<String, String> getInfo(String leafName) {
    final infoMap = {
      'mangga': {
        'emoji': '🥭',
        'fact': 'Daun mangga mengandung antioksidan dan sering digunakan untuk teh herbal!',
        'description': 'Daun mangga memiliki bentuk memanjang dengan ujung runcing.',
        'shape': 'melengkung',
        'shapeIcon': '🌊',
      },
      // ... data lainnya
    };
    
    return infoMap[leafName.toLowerCase()] ?? infoMap['default']!;
  }
  
  static String getShapeName(String shape) {
    final shapeNames = {
      'menjari': 'Menjari (seperti jari tangan)',
      'sejajar': 'Sejajar (tulang daun sejajar)',
      'melengkung': 'Melengkung (tulang daun melengkung)',
      'menyirip': 'Menyirip (tulang daun menyirip)',
    };
    return shapeNames[shape] ?? 'Tidak diketahui';
  }
}
```

#### 1.4 Create `core/constants/data/achievement_data.dart`

```dart
/// Achievement Data
/// 
/// Data level achievement.
/// 
/// Author: [Nama Anggota 3]
/// Date: December 9, 2024

class AchievementData {
  static List<Map<String, dynamic>> getAchievements() {
    return [
      {
        'emoji': '🌱',
        'title': 'Pemula',
        'description': 'Scan 1 daun',
        'target': 1,
      },
      // ... data lainnya
    ];
  }
}
```

#### 1.5 Create `core/constants/data/learn_data.dart`

```dart
/// Learn Data
/// 
/// Data pembelajaran tentang daun.
/// 
/// Author: [Nama Anggota 3]
/// Date: December 9, 2024

import 'package:flutter/material.dart';

class LearnData {
  static List<Map<String, dynamic>> getLessons() {
    return [
      {
        'emoji': '🌱',
        'title': 'Apa itu Fotosintesis?',
        'description': 'Fotosintesis adalah proses...',
        'color': const Color(0xFFC8E6C9),
      },
      // ... data lainnya
    ];
  }
}
```

#### 1.6 Create `core/constants/data/fun_facts.dart`

```dart
/// Fun Facts
/// 
/// Fakta menarik tentang daun.
/// 
/// Author: [Nama Anggota 1]
/// Date: December 9, 2024

class FunFacts {
  static List<String> getFacts() {
    return [
      '🌳 Satu pohon besar bisa menghasilkan oksigen untuk 2 orang sehari!',
      // ... data lainnya
    ];
  }
  
  static String getRandomFact() {
    final facts = getFacts();
    return facts[DateTime.now().millisecond % facts.length];
  }
}

class MotivationalMessages {
  static List<String> getMessages() {
    return [
      '🌟 Hebat! Kamu sudah menemukan daun baru!',
      // ... data lainnya
    ];
  }
  
  static String getRandomMessage() {
    final messages = getMessages();
    return messages[DateTime.now().millisecond % messages.length];
  }
}
```

---

### Step 2: Pindahkan Services

#### 2.1 Move `audio_service.dart`

**Dari:** `lib/audio_service.dart`
**Ke:** `lib/shared/services/audio_service.dart`

**Tidak perlu ubah isi**, hanya pindahkan file.

#### 2.2 Create `shared/services/api_service.dart`

Extract API logic dari main.dart:

```dart
/// API Service
/// 
/// Service untuk komunikasi dengan backend Flask.
/// 
/// Author: [Nama Anggota 2]
/// Date: December 9, 2024

import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

import '../../core/constants/app_constants.dart';

class ApiService {
  /// Upload dan predict gambar daun
  static Future<String?> predictLeaf({
    required XFile imageFile,
    Uint8List? webImage,
    required String model, // 'hayyin' atau 'naufal'
  }) async {
    try {
      final endpoint = model == "hayyin"
          ? AppConstants.predictHayyinEndpoint
          : AppConstants.predictNaufalEndpoint;
      
      final uri = Uri.parse("${AppConstants.apiBaseUrl}$endpoint");
      final request = http.MultipartRequest('POST', uri);

      if (kIsWeb) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            webImage!,
            filename: "upload.png",
            contentType: MediaType("image", "png"),
          ),
        );
      } else {
        final file = File(imageFile.path);
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
        return body['prediction']?.toString();
      } else {
        throw Exception('Server Error ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('API Error: $e');
      rethrow;
    }
  }

  static MediaType _mediaTypeFromMime(String mime) {
    final parts = mime.split('/');
    return MediaType(parts[0], parts[1]);
  }
}
```

#### 2.3 Create `shared/services/storage_service.dart`

Extract storage logic:

```dart
/// Storage Service
/// 
/// Service untuk menyimpan data lokal menggunakan SharedPreferences.
/// 
/// Author: [Nama Anggota 1]
/// Date: December 9, 2024

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';

class StorageService {
  /// Get total scans
  static Future<int> getTotalScans() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(AppConstants.totalScansKey) ?? 0;
  }

  /// Save total scans
  static Future<void> saveTotalScans(int count) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(AppConstants.totalScansKey, count);
  }

  /// Increment total scans
  static Future<int> incrementScans() async {
    final current = await getTotalScans();
    final newCount = current + 1;
    await saveTotalScans(newCount);
    return newCount;
  }
}
```

---

### Step 3: Pindahkan Widgets

#### 3.1 Move `achievement_notification.dart`

**Dari:** `lib/achievement_notification.dart`
**Ke:** `lib/shared/widgets/achievement_notification.dart`

**Update import** di file:
```dart
import '../../core/constants/app_colors.dart';
```

---

### Step 4: Reorganisasi Features

#### 4.1 Move `splash_screen.dart`

**Dari:** `lib/splash_screen.dart`
**Ke:** `lib/features/splash/splash_screen.dart`

**Update imports:**
```dart
import '../../core/constants/app_colors.dart';
import '../../core/constants/data/fun_facts.dart';
```

#### 4.2 Extract Scan Feature dari `main.dart`

Create `lib/features/scan/scan_page.dart`:

```dart
/// Scan Page
/// 
/// Halaman utama untuk scan dan identifikasi daun.
/// 
/// Features:
/// - Image picker (camera/gallery)
/// - Upload & predict
/// - Show results with confetti
/// - Achievement notification
/// - TTS audio
/// 
/// Author: [Nama Anggota 2]
/// Date: December 9, 2024

import 'package:flutter/material.dart';
// ... imports lainnya

import '../../core/constants/app_colors.dart';
import '../../core/constants/data/leaf_data.dart';
import '../../shared/services/api_service.dart';
import '../../shared/services/audio_service.dart';
import '../../shared/services/storage_service.dart';
import '../../shared/widgets/achievement_notification.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  // State variables
  // Methods
  // Build methods
}
```

---

## 📝 Update Imports di `main.dart`

Setelah reorganisasi, update imports:

```dart
import 'package:flutter/material.dart';

// Core
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';

// Features
import 'features/splash/splash_screen.dart';
import 'features/scan/scan_page.dart';
import 'features/learn/learn_page.dart';
import 'features/achievements/achievements_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
```

---

## ✅ Checklist Reorganisasi

### Core (Anggota 1)
- [ ] Create `core/constants/app_colors.dart`
- [ ] Create `core/constants/app_constants.dart`
- [ ] Create `core/constants/data/leaf_data.dart`
- [ ] Create `core/constants/data/achievement_data.dart`
- [ ] Create `core/constants/data/learn_data.dart`
- [ ] Create `core/constants/data/fun_facts.dart`
- [ ] Create `core/theme/app_theme.dart`
- [ ] Delete old `lib/constants.dart`

### Shared (Anggota 1)
- [ ] Move `audio_service.dart` to `shared/services/`
- [ ] Create `shared/services/api_service.dart`
- [ ] Create `shared/services/storage_service.dart`
- [ ] Move `achievement_notification.dart` to `shared/widgets/`
- [ ] Update all imports

### Features (Anggota 2 & 3)
- [ ] Move `splash_screen.dart` to `features/splash/`
- [ ] Extract `scan_page.dart` from `main.dart`
- [ ] Extract `learn_page.dart` from `main.dart`
- [ ] Extract `achievements_page.dart` from `main.dart`
- [ ] Update all imports
- [ ] Test each feature

### Final
- [ ] Update `main.dart` dengan imports baru
- [ ] Run `flutter analyze`
- [ ] Run `flutter test`
- [ ] Test di device
- [ ] Commit & push

---

## 🚀 Cara Kerja Tim

### Workflow:

1. **Anggota 1** (Core & Shared):
   ```bash
   git checkout -b feature/core-setup
   # Buat semua file di core/ dan shared/
   git add .
   git commit -m "Setup core and shared modules"
   git push origin feature/core-setup
   ```

2. **Anggota 2** (Scan Feature):
   ```bash
   git checkout -b feature/scan
   # Extract scan feature dari main.dart
   git add .
   git commit -m "Extract scan feature"
   git push origin feature/scan
   ```

3. **Anggota 3** (Learn & Achievements):
   ```bash
   git checkout -b feature/learn-achievements
   # Extract learn dan achievements
   git add .
   git commit -m "Extract learn and achievements features"
   git push origin feature/learn-achievements
   ```

4. **Merge**:
   - Review code
   - Merge ke main
   - Test integrasi

---

## 📊 Estimasi Waktu

| Task | Waktu | PIC |
|------|-------|-----|
| Setup core | 2 jam | Anggota 1 |
| Setup shared | 2 jam | Anggota 1 |
| Extract scan | 3 jam | Anggota 2 |
| Extract learn & achievements | 3 jam | Anggota 3 |
| Integration & testing | 2 jam | Semua |
| **Total** | **12 jam** | **3 orang** |

---

## 💡 Tips

1. **Jangan langsung delete file lama**
   - Buat file baru dulu
   - Test dulu
   - Baru delete yang lama

2. **Update imports bertahap**
   - Update 1 file
   - Test
   - Lanjut file berikutnya

3. **Commit sering**
   - Setiap selesai 1 file, commit
   - Mudah rollback kalau ada masalah

4. **Komunikasi**
   - Update progress di grup
   - Tanya kalau ada yang bingung
   - Review code bareng

---

**Version**: 2.0.0
**Last Updated**: December 9, 2024
