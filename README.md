
## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK (3.9.0 atau lebih baru)
- Server Flask untuk API klasifikasi daun
- Android Studio / VS Code dengan Flutter extension

### Instalasi

1. Clone repository ini
2. Install dependencies:
```bash
flutter pub get
```

3. Ubah IP server di `lib/main.dart`:
```dart
static const String apiBase = "http://YOUR_SERVER_IP:5000";
```

4. Jalankan aplikasi:
```bash
flutter run
```

## Dependencies

```yaml
dependencies:
  flutter_animate: ^4.5.0      # Animasi smooth
  confetti: ^0.7.0             # Efek confetti
  shared_preferences: ^2.2.2   # Simpan data lokal
  image_picker: ^0.8.7+4       # Ambil gambar
  http: ^1.1.0                 # API calls
```
