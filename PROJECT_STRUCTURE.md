# 📁 Struktur Project - Leaf Explorer

## 🏗️ Arsitektur: Feature-First Architecture

Struktur ini mengikuti best practices dari perusahaan-perusahaan besar seperti Google, Airbnb, dan Uber.

```
lib/
├── core/                    # Core functionality (digunakan di seluruh app)
│   ├── constants/          # Konstanta global
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_constants.dart
│   ├── theme/              # Theme & styling
│   │   └── app_theme.dart
│   └── utils/              # Utility functions
│       └── helpers.dart
│
├── shared/                  # Shared resources (digunakan di banyak feature)
│   ├── models/             # Data models
│   │   ├── leaf_model.dart
│   │   └── achievement_model.dart
│   ├── services/           # Services (API, Storage, Audio)
│   │   ├── api_service.dart
│   │   ├── audio_service.dart
│   │   └── storage_service.dart
│   └── widgets/            # Reusable widgets
│       ├── custom_button.dart
│       └── achievement_notification.dart
│
├── features/               # Features (setiap feature terpisah)
│   ├── splash/            # Splash Screen Feature
│   │   ├── splash_screen.dart
│   │   └── splash_controller.dart
│   │
│   ├── scan/              # Scan Feature (Main)
│   │   ├── scan_page.dart
│   │   ├── scan_controller.dart
│   │   └── widgets/
│   │       ├── image_preview.dart
│   │       ├── prediction_card.dart
│   │       └── action_buttons.dart
│   │
│   ├── learn/             # Learn Feature
│   │   ├── learn_page.dart
│   │   ├── learn_controller.dart
│   │   └── widgets/
│   │       └── learn_card.dart
│   │
│   └── achievements/      # Achievements Feature
│       ├── achievements_page.dart
│       ├── achievements_controller.dart
│       └── widgets/
│           └── achievement_card.dart
│
└── main.dart              # Entry point
```

---

## 📂 Penjelasan Setiap Folder

### 1. 🎯 `core/` - Inti Aplikasi

**Fungsi:** Berisi kode yang digunakan di SELURUH aplikasi.

**Isi:**
- **constants/**: Warna, text styles, konstanta
- **theme/**: Theme Material Design
- **utils/**: Helper functions, extensions

**Contoh:**
```dart
// core/constants/app_colors.dart
class AppColors {
  static const primaryGreen = Color(0xFF2E7D32);
  static const secondaryGreen = Color(0xFF66BB6A);
}
```

**Kapan digunakan:**
- Warna yang sama di banyak tempat
- Text style yang konsisten
- Konstanta global (API URL, dll)

---

### 2. 🔄 `shared/` - Resource Bersama

**Fungsi:** Berisi kode yang digunakan di BEBERAPA feature.

**Isi:**
- **models/**: Data models (Leaf, Achievement)
- **services/**: Services (API, Audio, Storage)
- **widgets/**: Reusable widgets

**Contoh:**
```dart
// shared/models/leaf_model.dart
class LeafModel {
  final String name;
  final String emoji;
  final String shape;
}

// shared/services/audio_service.dart
class AudioService {
  static Future<void> speak(String text) {}
}
```

**Kapan digunakan:**
- Widget yang dipakai di banyak feature
- Service yang diakses dari berbagai tempat
- Model data yang shared

---

### 3. 🎨 `features/` - Fitur Aplikasi

**Fungsi:** Setiap feature punya folder sendiri (ISOLATED).

**Struktur per feature:**
```
feature_name/
├── feature_page.dart       # UI/View
├── feature_controller.dart # Logic/State
└── widgets/               # Widgets khusus feature ini
    └── custom_widget.dart
```

**Keuntungan:**
- ✅ Mudah dikerjakan tim (1 orang = 1 feature)
- ✅ Tidak bentrok saat coding
- ✅ Mudah di-maintain
- ✅ Bisa di-reuse atau dihapus dengan mudah

**Contoh:**
```dart
// features/scan/scan_page.dart
class ScanPage extends StatelessWidget {
  // UI untuk scan feature
}

// features/scan/scan_controller.dart
class ScanController {
  // Logic untuk scan feature
}
```

---

## 👥 Pembagian Kerja Tim

### Anggota 1: Core & Shared
**Tanggung jawab:**
- Setup core (colors, theme, constants)
- Buat shared services (API, Audio, Storage)
- Buat shared models
- Buat reusable widgets

**File:**
- `core/constants/`
- `core/theme/`
- `shared/services/`
- `shared/models/`
- `shared/widgets/`

---

### Anggota 2: Splash & Scan Feature
**Tanggung jawab:**
- Splash screen
- Scan feature (main feature)
- Image picker
- Prediction logic

**File:**
- `features/splash/`
- `features/scan/`

---

### Anggota 3: Learn & Achievements Feature
**Tanggung jawab:**
- Learn page
- Achievements page
- Achievement notification
- Progress tracking

**File:**
- `features/learn/`
- `features/achievements/`

---

## 🔄 Dependency Flow

```
main.dart
    ↓
features/ (menggunakan)
    ↓
shared/ (menggunakan)
    ↓
core/
```

**Aturan:**
- ✅ `features/` boleh import `shared/` dan `core/`
- ✅ `shared/` boleh import `core/`
- ❌ `core/` TIDAK boleh import `shared/` atau `features/`
- ❌ Feature A TIDAK boleh import Feature B

---

## 📝 Naming Convention

### File Names
```
snake_case.dart
```
**Contoh:**
- `scan_page.dart`
- `audio_service.dart`
- `leaf_model.dart`

### Class Names
```
PascalCase
```
**Contoh:**
- `ScanPage`
- `AudioService`
- `LeafModel`

### Variable Names
```
camelCase
```
**Contoh:**
- `leafName`
- `totalScans`
- `isLoading`

### Constants
```
camelCase atau SCREAMING_SNAKE_CASE
```
**Contoh:**
- `primaryGreen`
- `API_BASE_URL`

---

## 🎯 Best Practices

### 1. Single Responsibility
Setiap file punya 1 tanggung jawab saja.

**❌ Bad:**
```dart
// scan_page.dart
class ScanPage {
  // UI
  // Logic
  // API calls
  // Storage
}
```

**✅ Good:**
```dart
// scan_page.dart - hanya UI
class ScanPage {}

// scan_controller.dart - hanya logic
class ScanController {}

// api_service.dart - hanya API
class ApiService {}
```

---

### 2. DRY (Don't Repeat Yourself)
Jangan copy-paste code. Buat reusable widget/function.

**❌ Bad:**
```dart
// Di scan_page.dart
ElevatedButton(...)

// Di learn_page.dart
ElevatedButton(...) // Copy paste!
```

**✅ Good:**
```dart
// shared/widgets/custom_button.dart
class CustomButton extends StatelessWidget {}

// Pakai di mana-mana
CustomButton(...)
```

---

### 3. Clear Imports
Import yang jelas dan terorganisir.

**✅ Good:**
```dart
// Dart imports
import 'dart:io';
import 'dart:convert';

// Flutter imports
import 'package:flutter/material.dart';

// Package imports
import 'package:http/http.dart' as http;

// Project imports
import 'package:app/core/constants/app_colors.dart';
import 'package:app/shared/services/audio_service.dart';
```

---

### 4. Documentation
Setiap file punya comment header.

```dart
/// Scan Page
/// 
/// Main page untuk scan dan identifikasi daun.
/// 
/// Features:
/// - Image picker (camera/gallery)
/// - Upload & predict
/// - Show results
/// 
/// Author: [Nama]
/// Date: [Tanggal]
class ScanPage extends StatelessWidget {
  // ...
}
```

---

## 🚀 Workflow Development

### 1. Setup (Anggota 1)
```bash
1. Buat struktur folder
2. Setup core (colors, theme)
3. Buat shared services
4. Commit & push
```

### 2. Feature Development (Anggota 2 & 3)
```bash
1. Pull latest code
2. Buat branch: feature/scan atau feature/learn
3. Kerjakan feature di folder masing-masing
4. Test feature
5. Commit & push
6. Create Pull Request
```

### 3. Integration
```bash
1. Review code
2. Merge ke main
3. Test integrasi
4. Fix bugs
```

---

## 📊 Progress Tracking

### Checklist Core (Anggota 1)
- [ ] Setup folder structure
- [ ] Create app_colors.dart
- [ ] Create app_theme.dart
- [ ] Create api_service.dart
- [ ] Create audio_service.dart
- [ ] Create storage_service.dart
- [ ] Create leaf_model.dart
- [ ] Create achievement_model.dart

### Checklist Scan Feature (Anggota 2)
- [ ] Create splash_screen.dart
- [ ] Create scan_page.dart
- [ ] Create scan_controller.dart
- [ ] Create image_preview.dart
- [ ] Create prediction_card.dart
- [ ] Create action_buttons.dart
- [ ] Integrate with API service
- [ ] Test scan flow

### Checklist Learn & Achievements (Anggota 3)
- [ ] Create learn_page.dart
- [ ] Create learn_controller.dart
- [ ] Create learn_card.dart
- [ ] Create achievements_page.dart
- [ ] Create achievements_controller.dart
- [ ] Create achievement_card.dart
- [ ] Create achievement_notification.dart
- [ ] Test achievement unlock

---

## 🎓 Penjelasan untuk Dosen

### Mengapa Struktur Ini?

**1. Scalability**
- Mudah menambah feature baru
- Tidak mengganggu feature lain

**2. Maintainability**
- Mudah mencari file
- Mudah fix bugs
- Mudah update

**3. Team Collaboration**
- Setiap orang kerja di folder berbeda
- Minim conflict saat merge
- Clear responsibility

**4. Industry Standard**
- Digunakan di perusahaan besar
- Best practice Flutter
- Professional approach

---

## 📚 Resources

### Belajar Lebih Lanjut:
- [Flutter Architecture](https://flutter.dev/docs/development/data-and-backend/state-mgmt/options)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Feature-First](https://codewithandrea.com/articles/flutter-project-structure/)

---

**Version**: 2.0.0
**Last Updated**: December 9, 2024
**Architecture**: Feature-First with Clean Architecture principles
