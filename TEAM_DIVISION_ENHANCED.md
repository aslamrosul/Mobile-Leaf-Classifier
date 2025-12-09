# 👥 Pembagian Kerja Tim - Enhanced Version (5 Anggota)

## 🚀 Versi Enhanced dengan Quiz, Login & Leaderboard

Setiap anggota punya **1 fitur utama** yang lengkap dan substantial!

---

## 📋 Pembagian Fitur

### 👤 Anggota 1: 🔐 Authentication & Profile
**Fitur Utama:** Login, Register, Profile Management

**Tanggung Jawab:**
- Login/Register system
- Firebase Authentication setup
- User profile page
- Edit profile & avatar
- Session management
- Statistics display

**Deliverables:**
```
✅ Login page dengan email/password
✅ Register page dengan validation
✅ Google Sign-In (optional)
✅ Profile page dengan stats
✅ Edit profile functionality
✅ Logout & session handling
```

**Estimasi:** 12-14 jam

---

### 👤 Anggota 2: 📸 Scan & History
**Fitur Utama:** Main Scan Feature + History

**Tanggung Jawab:**
- Image picker (camera/gallery)
- Upload & predict dengan AI
- Result display dengan audio
- Scan history management
- Points system integration
- API integration

**Deliverables:**
```
✅ Scan page dengan image picker
✅ Prediction dengan 2 models
✅ Result card dengan info lengkap
✅ Scan history page
✅ Save/delete history
✅ Points calculation
```

**Estimasi:** 12-14 jam

---

### 👤 Anggota 3: 🎯 Quiz & Mini Games
**Fitur Utama:** Interactive Quiz System

**Tanggung Jawab:**
- Quiz UI (multiple choice, true/false)
- Image-based questions
- Timer & scoring system
- Quiz results & explanation
- Quiz data & categories
- Share results

**Deliverables:**
```
✅ Quiz page dengan 3 types questions
✅ Timer (optional)
✅ Score calculation
✅ Result page dengan explanation
✅ 30+ questions bank
✅ Difficulty levels (easy/medium/hard)
```

**Estimasi:** 10-12 jam

---

### 👤 Anggota 4: 🏆 Leaderboard & Competition
**Fitur Utama:** Leaderboard System

**Tanggung Jawab:**
- Global leaderboard
- Weekly leaderboard
- Points system
- Ranking algorithm
- Competition features
- Badges & rewards

**Deliverables:**
```
✅ Leaderboard page (global & weekly)
✅ User ranking display
✅ Points calculation system
✅ Rank badges (🥇🥈🥉)
✅ Filter tabs
✅ Real-time updates
```

**Estimasi:** 10-12 jam

---

### 👤 Anggota 5: 📚 Learn & Achievements
**Fitur Utama:** Educational Content & Gamification

**Tanggung Jawab:**
- Learn page dengan 8+ topics
- Achievement system (10+ achievements)
- Achievement notifications
- Progress tracking
- Educational data
- Gamification elements

**Deliverables:**
```
✅ Learn page dengan 8+ topics
✅ Interactive learn cards
✅ Achievements page (10+ achievements)
✅ Achievement notification
✅ Progress bars
✅ Badge collection
```

**Estimasi:** 10-12 jam

---

## 🗂️ Struktur Folder Enhanced

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_constants.dart
│   │   └── data/
│   │       ├── leaf_data.dart
│   │       ├── quiz_data.dart          ← Anggota 3
│   │       ├── learn_data.dart         ← Anggota 5
│   │       └── achievement_data.dart   ← Anggota 5
│   ├── theme/
│   │   └── app_theme.dart
│   └── utils/
│       └── helpers.dart
│
├── shared/
│   ├── models/
│   │   ├── user_model.dart             ← Anggota 1
│   │   ├── scan_result_model.dart      ← Anggota 2
│   │   ├── quiz_model.dart             ← Anggota 3
│   │   ├── leaderboard_model.dart      ← Anggota 4
│   │   └── achievement_model.dart      ← Anggota 5
│   │
│   ├── services/
│   │   ├── auth_service.dart           ← Anggota 1
│   │   ├── user_service.dart           ← Anggota 1
│   │   ├── api_service.dart            ← Anggota 2
│   │   ├── scan_service.dart           ← Anggota 2
│   │   ├── audio_service.dart          ← Anggota 2
│   │   ├── storage_service.dart        ← Anggota 2
│   │   ├── quiz_service.dart           ← Anggota 3
│   │   └── leaderboard_service.dart    ← Anggota 4
│   │
│   └── widgets/
│       ├── custom_button.dart
│       ├── loading_indicator.dart
│       └── achievement_notification.dart ← Anggota 5
│
└── features/
    ├── splash/
    │   └── splash_screen.dart
    │
    ├── auth/                            ← Anggota 1
    │   ├── login_page.dart
    │   ├── register_page.dart
    │   ├── auth_controller.dart
    │   └── widgets/
    │       ├── login_form.dart
    │       └── register_form.dart
    │
    ├── profile/                         ← Anggota 1
    │   ├── profile_page.dart
    │   ├── profile_controller.dart
    │   └── widgets/
    │       ├── profile_header.dart
    │       ├── stats_card.dart
    │       └── edit_profile_dialog.dart
    │
    ├── scan/                            ← Anggota 2
    │   ├── scan_page.dart
    │   ├── scan_controller.dart
    │   ├── scan_history_page.dart
    │   └── widgets/
    │       ├── image_preview.dart
    │       ├── prediction_card.dart
    │       ├── action_buttons.dart
    │       └── history_card.dart
    │
    ├── quiz/                            ← Anggota 3
    │   ├── quiz_page.dart
    │   ├── quiz_controller.dart
    │   ├── quiz_result_page.dart
    │   └── widgets/
    │       ├── question_card.dart
    │       ├── answer_option.dart
    │       ├── quiz_timer.dart
    │       └── result_summary.dart
    │
    ├── leaderboard/                     ← Anggota 4
    │   ├── leaderboard_page.dart
    │   ├── leaderboard_controller.dart
    │   └── widgets/
    │       ├── leaderboard_card.dart
    │       ├── rank_badge.dart
    │       └── user_rank_card.dart
    │
    ├── learn/                           ← Anggota 5
    │   ├── learn_page.dart
    │   ├── learn_controller.dart
    │   └── widgets/
    │       ├── learn_card.dart
    │       └── lesson_detail.dart
    │
    └── achievements/                    ← Anggota 5
        ├── achievements_page.dart
        ├── achievements_controller.dart
        └── widgets/
            ├── achievement_card.dart
            └── progress_indicator.dart
```

---

## 📅 Timeline 4 Minggu

### Week 1: Setup & Authentication (5 hari)

**Day 1-2: Setup (All)**
- [ ] Setup Firebase project
- [ ] Add Firebase to Flutter
- [ ] Setup folder structure
- [ ] Create branches

**Day 3-5: Auth Development (Anggota 1)**
- [ ] Login page UI
- [ ] Register page UI
- [ ] Firebase Auth integration
- [ ] Profile page basic

**Day 3-5: Preparation (Anggota 2-5)**
- [ ] Create models
- [ ] Create services skeleton
- [ ] Setup data constants
- [ ] Create basic widgets

---

### Week 2: Core Features Development (5 hari)

**Parallel Development:**

**Anggota 1 (Auth & Profile):**
- [ ] Complete profile page
- [ ] Edit profile functionality
- [ ] Avatar upload
- [ ] Statistics display
- [ ] Session management

**Anggota 2 (Scan):**
- [ ] Scan page UI
- [ ] Image picker integration
- [ ] API integration
- [ ] Result display
- [ ] Scan history

**Anggota 3 (Quiz):**
- [ ] Quiz page UI
- [ ] Question types implementation
- [ ] Timer & scoring
- [ ] Result page
- [ ] Quiz data (30+ questions)

**Anggota 4 (Leaderboard):**
- [ ] Leaderboard UI
- [ ] Firebase Firestore integration
- [ ] Ranking algorithm
- [ ] Points calculation
- [ ] Real-time updates

**Anggota 5 (Learn & Achievements):**
- [ ] Learn page UI
- [ ] Learn data (8+ topics)
- [ ] Achievements page UI
- [ ] Achievement logic
- [ ] Notification system

---

### Week 3: Integration & Testing (5 hari)

**Day 1-2: Feature Integration**
- [ ] Connect all features to Firebase
- [ ] Integrate points system
- [ ] Connect leaderboard with scan/quiz
- [ ] Test navigation flow

**Day 3-4: Testing**
- [ ] Unit testing
- [ ] Integration testing
- [ ] User flow testing
- [ ] Bug fixes

**Day 5: Polish**
- [ ] UI/UX improvements
- [ ] Performance optimization
- [ ] Error handling
- [ ] Loading states

---

### Week 4: Final & Presentation (5 hari)

**Day 1-2: Final Testing**
- [ ] End-to-end testing
- [ ] Device testing (multiple devices)
- [ ] Network testing
- [ ] Edge cases

**Day 3: Documentation**
- [ ] Code documentation
- [ ] API documentation
- [ ] User guide
- [ ] README update

**Day 4: Presentation Prep**
- [ ] Create slides (20-25 slides)
- [ ] Prepare demo
- [ ] Record video backup
- [ ] Practice presentation

**Day 5: Final Review**
- [ ] Team rehearsal
- [ ] Q&A preparation
- [ ] Final polish
- [ ] Ready to present!

---

## 🔥 Points System

### Earning Points

**Scan:**
- First scan of the day: +15 points
- Regular scan: +10 points
- New leaf type: +5 bonus
- Daily streak (7 days): +100 bonus

**Quiz:**
- Easy question correct: +5 points
- Medium question correct: +10 points
- Hard question correct: +15 points
- Perfect score (10/10): +50 bonus
- First quiz of the day: +10 bonus

**Achievements:**
- Pemula: +50 points
- Penjelajah: +100 points
- Ahli Daun: +200 points
- Master Botanis: +500 points
- Legenda Hijau: +1000 points

**Daily:**
- Daily login: +5 points
- Complete daily challenge: +50 points

---

## 🏆 Leaderboard Ranking

### Rank Tiers

| Rank | Points | Badge |
|------|--------|-------|
| 1-3 | Any | 🥇🥈🥉 |
| 4-10 | Any | 🏅 |
| 11-50 | Any | ⭐ |
| 51-100 | Any | 🌟 |
| 100+ | Any | 🌱 |

### Weekly Reset
- Every Monday 00:00
- Top 3 get special badges
- Weekly champion badge
- Bonus points for top 10

---

## 📱 App Flow

### First Time User
```
1. Splash Screen
2. Login/Register
3. Tutorial (optional)
4. Home Dashboard
5. Explore features
```

### Returning User
```
1. Splash Screen
2. Auto-login
3. Home Dashboard
4. Continue where left off
```

### Main Navigation
```
Bottom Nav:
├── 🏠 Home (Dashboard with stats)
├── 📸 Scan
├── 🎯 Quiz
├── 📚 Learn
└── 👤 Profile

Drawer/Menu:
├── 🏆 Leaderboard
├── 🎖️ Achievements
├── 📊 Statistics
├── 📜 History
├── ⚙️ Settings
└── 🚪 Logout
```

---

## 🎯 Success Criteria per Anggota

### Anggota 1 (Auth)
- [ ] User can register
- [ ] User can login
- [ ] User can edit profile
- [ ] User can upload avatar
- [ ] Session persists
- [ ] Logout works
- [ ] Stats display correctly

### Anggota 2 (Scan)
- [ ] Can pick image from camera/gallery
- [ ] Can predict leaf type
- [ ] Result displays correctly
- [ ] Audio works
- [ ] History saves
- [ ] Can delete history
- [ ] Points awarded correctly

### Anggota 3 (Quiz)
- [ ] Can start quiz
- [ ] Questions display correctly
- [ ] Can answer questions
- [ ] Timer works (if implemented)
- [ ] Score calculates correctly
- [ ] Result shows explanation
- [ ] Points awarded correctly

### Anggota 4 (Leaderboard)
- [ ] Leaderboard displays top users
- [ ] User's rank shows correctly
- [ ] Points update in real-time
- [ ] Weekly leaderboard works
- [ ] Filters work (global/weekly)
- [ ] Rank badges display

### Anggota 5 (Learn & Achievements)
- [ ] Learn topics display
- [ ] Cards are interactive
- [ ] Achievements display
- [ ] Progress bars work
- [ ] Notifications show
- [ ] Unlock logic works

---

## 💻 Tech Stack

### Core
```yaml
dependencies:
  flutter: sdk
  
  # Firebase
  firebase_core: ^2.24.0
  firebase_auth: ^4.15.0
  cloud_firestore: ^4.13.0
  firebase_storage: ^11.5.0
  
  # State Management
  provider: ^6.1.1
  
  # UI
  flutter_animate: ^4.5.0
  confetti: ^0.7.0
  cached_network_image: ^3.3.0
  
  # Audio
  audioplayers: ^5.2.1
  flutter_tts: ^3.8.5
  
  # Utils
  shared_preferences: ^2.2.2
  image_picker: ^0.8.7+4
  http: ^1.1.0
  
  # Social
  google_sign_in: ^6.1.5
  share_plus: ^7.2.1
```

---

## 📞 Communication Enhanced

### Daily Standup (9:00 AM - 15 min)
**Format:**
- Yesterday's progress
- Today's plan
- Blockers
- **NEW:** Points earned (gamify standup!)

### Weekly Demo (Friday 4:00 PM - 1 hour)
**Format:**
- Each member demo their feature
- Feedback session
- Integration discussion
- Next week planning

### Tools
- 💬 WhatsApp - Daily chat
- 🐙 GitHub - Code & PR
- 📹 Google Meet - Video calls
- 📋 Trello - Task tracking
- 🔥 Firebase Console - Backend

---

## 🎓 Untuk Presentasi ke Dosen

### Slide: Enhanced Features Comparison

**Before (Basic Version):**
```
❌ No user accounts
❌ No competition
❌ No interactive learning
❌ Limited engagement
```

**After (Enhanced Version):**
```
✅ User authentication & profiles
✅ Leaderboard & competition
✅ Interactive quiz system
✅ Points & rewards
✅ Social features
✅ Better engagement
```

### Value Proposition

> "Dengan versi enhanced ini, aplikasi kami tidak hanya tool untuk 
> identifikasi daun, tapi menjadi **platform pembelajaran lengkap** 
> dengan gamification yang membuat anak-anak **termotivasi** untuk 
> terus belajar.
> 
> **Login system** memungkinkan tracking progress individual.
> **Quiz** membuat pembelajaran interaktif dan fun.
> **Leaderboard** menciptakan kompetisi sehat.
> **Points system** memberikan reward untuk setiap aktivitas.
> 
> Ini adalah **complete educational platform** yang siap digunakan 
> di sekolah-sekolah!"

---

**Version**: 3.0.0 - Enhanced Edition
**Features**: 7 Major Features
**Team Size**: 5 Members
**Timeline**: 4 Weeks
**Last Updated**: December 9, 2024
