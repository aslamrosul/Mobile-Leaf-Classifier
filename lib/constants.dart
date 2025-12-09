import 'package:flutter/material.dart';

/// Konstanta warna untuk tema hijau-putih profesional
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

/// Bentuk daun
enum LeafShape {
  menjari,    // Seperti jari tangan (pepaya, singkong)
  sejajar,    // Tulang daun sejajar (pisang, padi)
  melengkung, // Tulang daun melengkung (mangga, jambu)
  menyirip,   // Tulang daun menyirip (nangka, asam)
}

/// Data informasi tentang berbagai jenis daun
class LeafInfo {
  static Map<String, String> getInfo(String leafName) {
    final infoMap = {
      'mangga': {
        'emoji': '🥭',
        'fact': 'Daun mangga mengandung antioksidan dan sering digunakan untuk teh herbal!',
        'description': 'Daun mangga memiliki bentuk memanjang dengan ujung runcing.',
        'shape': 'melengkung',
        'shapeIcon': '🌊',
      },
      'jambu': {
        'emoji': '🍈',
        'fact': 'Daun jambu bisa digunakan untuk mengobati diare dan menjaga kesehatan mulut!',
        'description': 'Daun jambu berbentuk oval dengan permukaan yang halus.',
        'shape': 'melengkung',
        'shapeIcon': '🌊',
      },
      'pepaya': {
        'emoji': '🌴',
        'fact': 'Daun pepaya mengandung enzim papain yang baik untuk pencernaan!',
        'description': 'Daun pepaya besar dengan bentuk menjari dan tangkai panjang.',
        'shape': 'menjari',
        'shapeIcon': '✋',
      },
      'singkong': {
        'emoji': '🌿',
        'fact': 'Daun singkong kaya protein dan bisa diolah menjadi sayuran lezat!',
        'description': 'Daun singkong memiliki 5-7 jari dengan tepi bergerigi.',
        'shape': 'menjari',
        'shapeIcon': '✋',
      },
      'pisang': {
        'emoji': '🍌',
        'fact': 'Daun pisang sering digunakan sebagai pembungkus makanan tradisional!',
        'description': 'Daun pisang sangat lebar dan panjang dengan tulang daun tengah yang kuat.',
        'shape': 'sejajar',
        'shapeIcon': '📏',
      },
      'nangka': {
        'emoji': '🍈',
        'fact': 'Daun nangka bisa digunakan sebagai pakan ternak dan obat tradisional!',
        'description': 'Daun nangka berbentuk oval dengan tulang daun menyirip.',
        'shape': 'menyirip',
        'shapeIcon': '🪶',
      },
      'default': {
        'emoji': '🌿',
        'fact': 'Daun adalah organ tumbuhan yang sangat penting untuk fotosintesis!',
        'description': 'Setiap daun memiliki karakteristik unik yang membedakannya.',
        'shape': 'melengkung',
        'shapeIcon': '🌊',
      },
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

/// Data achievement levels
class AchievementData {
  static List<Map<String, dynamic>> getAchievements() {
    return [
      {
        'emoji': '🌱',
        'title': 'Pemula',
        'description': 'Scan 1 daun',
        'target': 1,
      },
      {
        'emoji': '🌿',
        'title': 'Penjelajah',
        'description': 'Scan 5 daun',
        'target': 5,
      },
      {
        'emoji': '🍃',
        'title': 'Ahli Daun',
        'description': 'Scan 10 daun',
        'target': 10,
      },
      {
        'emoji': '🌳',
        'title': 'Master Botanis',
        'description': 'Scan 25 daun',
        'target': 25,
      },
      {
        'emoji': '🏆',
        'title': 'Legenda Hijau',
        'description': 'Scan 50 daun',
        'target': 50,
      },
    ];
  }
}

/// Data pembelajaran tentang daun
class LearnData {
  static List<Map<String, dynamic>> getLessons() {
    return [
      {
        'emoji': '🌱',
        'title': 'Apa itu Fotosintesis?',
        'description': 'Fotosintesis adalah proses daun membuat makanan menggunakan sinar matahari, air, dan udara! Daun mengubah karbon dioksida dan air menjadi gula dan oksigen.',
        'color': const Color(0xFFC8E6C9),
      },
      {
        'emoji': '🍃',
        'title': 'Bagian-bagian Daun',
        'description': 'Daun punya tangkai (petiolus), tulang daun (vena), dan helai daun (lamina). Setiap bagian punya tugasnya! Tangkai menghubungkan daun ke batang, tulang daun mengangkut air dan nutrisi.',
        'color': const Color(0xFFDCEDC8),
      },
      {
        'emoji': '🌿',
        'title': 'Kenapa Daun Hijau?',
        'description': 'Daun hijau karena punya klorofil yang menangkap sinar matahari untuk membuat makanan. Klorofil menyerap cahaya merah dan biru, tapi memantulkan cahaya hijau!',
        'color': const Color(0xFFC5E1A5),
      },
      {
        'emoji': '🍂',
        'title': 'Kenapa Daun Gugur?',
        'description': 'Di musim gugur, pohon menyimpan energi dan daun berubah warna lalu gugur. Ini cara pohon bertahan hidup saat cuaca dingin. Warna kuning dan merah muncul saat klorofil hilang!',
        'color': const Color(0xFFFFE0B2),
      },
      {
        'emoji': '💚',
        'title': 'Manfaat Daun',
        'description': 'Daun memberi kita oksigen untuk bernapas dan membuat udara lebih segar! Satu pohon besar bisa menghasilkan oksigen untuk 2 orang setiap hari. Daun juga menyerap polusi udara!',
        'color': const Color(0xFFB2DFDB),
      },
      {
        'emoji': '🔬',
        'title': 'Stomata - Mulut Daun',
        'description': 'Daun punya lubang kecil bernama stomata yang bisa membuka dan menutup. Stomata digunakan untuk bernapas dan mengeluarkan air. Kamu bisa melihatnya dengan mikroskop!',
        'color': const Color(0xFFB2EBF2),
      },
      {
        'emoji': '🌈',
        'title': 'Warna-warni Daun',
        'description': 'Tidak semua daun hijau! Ada daun merah, ungu, bahkan pink. Warna berbeda ini karena pigmen selain klorofil seperti antosianin dan karotenoid.',
        'color': const Color(0xFFF8BBD0),
      },
      {
        'emoji': '🍽️',
        'title': 'Daun yang Bisa Dimakan',
        'description': 'Banyak daun yang bisa dimakan dan bergizi! Seperti bayam, kangkung, daun singkong, dan selada. Daun hijau kaya vitamin dan mineral yang baik untuk tubuh.',
        'color': const Color(0xFFC5CAE9),
      },
    ];
  }
}

/// Fun facts tentang daun
class FunFacts {
  static List<String> getFacts() {
    return [
      '🌳 Satu pohon besar bisa menghasilkan oksigen untuk 2 orang sehari!',
      '🍃 Daun terbesar di dunia adalah daun palem Raffia yang bisa mencapai 25 meter!',
      '🌿 Daun bisa "bernapas" melalui lubang kecil bernama stomata.',
      '🎨 Warna hijau daun berasal dari klorofil yang menangkap sinar matahari.',
      '🍂 Daun gugur di musim gugur untuk menghemat energi pohon.',
      '💧 Daun mengeluarkan air melalui proses transpirasi.',
      '🌍 Hutan Amazon menghasilkan 20% oksigen dunia dari daun-daunnya!',
      '🔬 Beberapa daun bisa bergerak mengikuti arah matahari.',
      '🌱 Daun adalah "pabrik makanan" untuk seluruh tumbuhan.',
      '🦋 Banyak serangga bergantung pada daun untuk makanan dan tempat tinggal.',
    ];
  }
  
  static String getRandomFact() {
    final facts = getFacts();
    return facts[DateTime.now().millisecond % facts.length];
  }
}

/// Motivational messages untuk anak-anak
class MotivationalMessages {
  static List<String> getMessages() {
    return [
      '🌟 Hebat! Kamu sudah menemukan daun baru!',
      '🎉 Luar biasa! Terus jelajahi alam!',
      '💚 Kamu adalah penjelajah alam yang hebat!',
      '🌿 Wow! Pengetahuanmu tentang daun bertambah!',
      '⭐ Keren! Kamu semakin pintar tentang tumbuhan!',
      '🏆 Mantap! Terus semangat mengeksplorasi!',
      '🌱 Bagus sekali! Kamu pecinta alam sejati!',
      '✨ Fantastis! Alam menunggumu untuk dijelajahi!',
    ];
  }
  
  static String getRandomMessage() {
    final messages = getMessages();
    return messages[DateTime.now().millisecond % messages.length];
  }
}
