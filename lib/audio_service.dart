import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();
  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;

  /// Initialize TTS
  static Future<void> initialize() async {
    if (_isInitialized) return;
    
    await _tts.setLanguage('id-ID'); // Bahasa Indonesia
    await _tts.setSpeechRate(0.9); // Kecepatan bicara normal (0.9 = sedikit lambat tapi jelas)
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.1); // Pitch sedikit lebih tinggi, cocok untuk anak
    
    _isInitialized = true;
  }

  /// Set custom speech rate (0.5 = lambat, 1.0 = normal, 1.5 = cepat)
  static Future<void> setSpeechRate(double rate) async {
    await initialize();
    await _tts.setSpeechRate(rate);
  }

  /// Set custom pitch (0.5 = rendah, 1.0 = normal, 1.5 = tinggi)
  static Future<void> setPitch(double pitch) async {
    await initialize();
    await _tts.setPitch(pitch);
  }

  /// Play achievement sound
  static Future<void> playAchievementSound() async {
    try {
      // Play success sound (bisa diganti dengan file audio custom)
      await _player.play(AssetSource('sounds/achievement.mp3'));
    } catch (e) {
      // Jika file tidak ada, skip
      debugPrint('Achievement sound not found: $e');
    }
  }

  /// Play success sound
  static Future<void> playSuccessSound() async {
    try {
      await _player.play(AssetSource('sounds/success.mp3'));
    } catch (e) {
      debugPrint('Success sound not found: $e');
    }
  }

  /// Speak text using TTS
  static Future<void> speak(String text) async {
    await initialize();
    await _tts.speak(text);
  }

  /// Stop speaking
  static Future<void> stop() async {
    await _tts.stop();
  }

  /// Speak leaf name with description
  static Future<void> speakLeafInfo(String leafName, String description) async {
    await initialize();
    final text = 'Ini adalah daun $leafName. $description';
    await _tts.speak(text);
  }

  /// Speak achievement
  static Future<void> speakAchievement(String achievementName) async {
    await initialize();
    final text = 'Selamat! Kamu mendapat pencapaian $achievementName!';
    await _tts.speak(text);
  }

  /// Dispose resources
  static Future<void> dispose() async {
    await _player.dispose();
    await _tts.stop();
  }
}
