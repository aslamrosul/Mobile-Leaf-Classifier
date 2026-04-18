
# 🌿 Mobile Leaf Classifier

Aplikasi mobile Flutter untuk mendeteksi dan mengenali jenis daun menggunakan layanan API backend Flask. Proyek ini dibuat untuk membantu pengguna memindai gambar daun, mendapatkan prediksi otomatis, belajar tentang daun, dan mengumpulkan prestasi.

## ✨ Fitur Utama

- Scan foto daun dari kamera atau galeri
- Kirim gambar ke API Flask untuk klasifikasi
- Pilih model prediksi: `hayyin` atau `naufal`
- Efek confetti dan suara saat prediksi berhasil
- Teks-ke-suara untuk nama daun dan fakta menarik
- Statistik jumlah scan tersimpan secara lokal
- Halaman `Belajar` dan `Prestasi`

## 🧩 Struktur Proyek

- `lib/main.dart` - logika UI utama dan integrasi klasifikasi
- `lib/constants.dart` - warna dan konstanta tema
- `lib/splash_screen.dart` - halaman splash startup
- `lib/audio_service.dart` - layanan suara dan efek audio
- `lib/achievement_notification.dart` - notifikasi prestasi
- `pubspec.yaml` - daftar dependency dan aset

## 🚀 Cara Menjalankan

### Prasyarat
- Flutter SDK 3.9.0 atau lebih baru
- Android Studio atau VS Code dengan plugin Flutter
- Server Flask untuk API klasifikasi daun

### Langkah Instalasi

1. Clone repository:
```bash
git clone https://github.com/aslamrosul/Mobile-Leaf-Classifier.git
cd Mobile-Leaf-Classifier
```
2. Install dependency Flutter:
```bash
flutter pub get
```
3. Sesuaikan alamat server API di `lib/main.dart`:
```dart
static const String apiBase = "http://192.168.75.27:5000";
```
Ganti `192.168.75.27` dengan alamat IP server Flask Anda.
4. Jalankan aplikasi:
```bash
flutter run
```

## 🛠️ Dependency Utama

Proyek ini menggunakan paket berikut:

- `flutter_animate` - animasi UI
- `confetti` - efek perayaan
- `shared_preferences` - simpan data lokal
- `image_picker` - ambil foto dari kamera/galeri
- `http` - komunikasi API
- `flutter_tts` - teks-ke-suara
- `audioplayers` - pemutar suara

## ✅ Catatan Penting

- Pastikan backend Flask siap dan menerima endpoint prediksi
- Gunakan alamat IP lokal yang sama dengan jaringan perangkat
- Untuk web, aplikasi menangani upload gambar sebagai bytes

## 📌 Rekomendasi Perbaikan

- Tambahkan dokumentasi backend Flask dan contoh response API
- Buat halaman `About` untuk daftar jenis daun dan fakta
- Tambahkan unit test untuk fungsi prediksi dan audio

## 📄 Lisensi

Repository ini dapat dikembangkan lebih lanjut untuk kebutuhan pembelajaran dan presentasi.
