# 🚀 Enhanced Features - Leaf Explorer

## 🎯 Fitur Tambahan untuk 5 Anggota

Dengan menambahkan **Quiz, Login, dan Leaderboard**, setiap anggota punya fitur lengkap!

---

## 📋 Pembagian Fitur Baru (5 Anggota)

### 👤 Anggota 1: Authentication & Profile
**Feature:** Login, Register, Profile

**Tanggung Jawab:**
1. **Login/Register System**
   - Email/password authentication
   - Google Sign-In (optional)
   - Form validation
   - Error handling

2. **Profile Management**
   - User profile page
   - Edit profile
   - Avatar upload
   - Statistics display

3. **Core Setup**
   - Setup Firebase/Backend
   - Auth service
   - User model
   - Session management

**Files:**
```
features/auth/
├── login_page.dart
├── register_page.dart
├── auth_controller.dart
└── widgets/
    ├── login_form.dart
    └── register_form.dart

features/profile/
├── profile_page.dart
├── profile_controller.dart
└── widgets/
    ├── profile_header.dart
    ├── stats_card.dart
    └── edit_profile_dialog.dart

shared/services/
├── auth_service.dart
└── user_service.dart

shared/models/
└── user_model.dart
```

**Estimasi:** 12-14 jam

---

### 👤 Anggota 2: Scan & Identification
**Feature:** Main Scan Feature

**Tanggung Jawab:**
1. **Scan Feature**
   - Image picker (camera/gallery)
   - Image preview
   - Upload & predict
   - Result display

2. **Scan History**
   - Save scan results
   - View history
   - Delete history
   - Export history

3. **Integration**
   - API integration
   - Audio integration
   - Storage integration

**Files:**
```
features/scan/
├── scan_page.dart
├── scan_controller.dart
├── scan_history_page.dart
└── widgets/
    ├── image_preview.dart
    ├── prediction_card.dart
    ├── action_buttons.dart
    ├── model_selector.dart
    └── history_card.dart

shared/services/
├── api_service.dart
└── scan_service.dart

shared/models/
└── scan_result_model.dart
```

**Estimasi:** 12-14 jam

---

### 👤 Anggota 3: Quiz & Mini Games
**Feature:** Interactive Quiz

**Tanggung Jawab:**
1. **Quiz System**
   - Multiple choice questions
   - True/False questions
   - Image-based questions
   - Timer (optional)

2. **Quiz Results**
   - Score calculation
   - Correct/wrong answers
   - Explanation for answers
   - Share results

3. **Quiz Data**
   - Question bank
   - Categories (easy, medium, hard)
   - Random questions
   - Progress tracking

**Files:**
```
features/quiz/
├── quiz_page.dart
├── quiz_controller.dart
├── quiz_result_page.dart
└── widgets/
    ├── question_card.dart
    ├── answer_option.dart
    ├── quiz_timer.dart
    └── result_summary.dart

core/constants/data/
└── quiz_data.dart

shared/models/
├── quiz_model.dart
└── question_model.dart
```

**Estimasi:** 10-12 jam

---

### 👤 Anggota 4: Leaderboard & Competition
**Feature:** Leaderboard System

**Tanggung Jawab:**
1. **Leaderboard**
   - Global leaderboard
   - Weekly leaderboard
   - Friends leaderboard
   - Ranking system

2. **Points System**
   - Points for scan
   - Points for quiz
   - Points for achievements
   - Bonus points

3. **Competition**
   - Weekly challenges
   - Badges
   - Rewards
   - Notifications

**Files:**
```
features/leaderboard/
├── leaderboard_page.dart
├── leaderboard_controller.dart
└── widgets/
    ├── leaderboard_card.dart
    ├── rank_badge.dart
    ├── user_rank_card.dart
    └── filter_tabs.dart

shared/services/
└── leaderboard_service.dart

shared/models/
├── leaderboard_model.dart
└── rank_model.dart
```

**Estimasi:** 10-12 jam

---

### 👤 Anggota 5: Learn & Achievements
**Feature:** Educational Content & Gamification

**Tanggung Jawab:**
1. **Learn Feature**
   - 8+ educational topics
   - Interactive cards
   - Animations
   - Bookmarks

2. **Achievements System**
   - 5+ achievement levels
   - Progress tracking
   - Notifications
   - Badge collection

3. **Educational Content**
   - Fun facts
   - Tips & tricks
   - Did you know?
   - Daily facts

**Files:**
```
features/learn/
├── learn_page.dart
├── learn_controller.dart
└── widgets/
    ├── learn_card.dart
    └── lesson_detail.dart

features/achievements/
├── achievements_page.dart
├── achievements_controller.dart
└── widgets/
    ├── achievement_card.dart
    └── progress_indicator.dart

shared/widgets/
└── achievement_notification.dart

core/constants/data/
├── learn_data.dart
└── achievement_data.dart
```

**Estimasi:** 10-12 jam

---

## 🎨 Struktur Aplikasi Lengkap

### Navigation Structure

```
App
├── Splash Screen
├── Login/Register (jika belum login)
└── Main App (setelah login)
    ├── Home (Dashboard)
    ├── Scan
    ├── Quiz
    ├── Learn
    ├── Leaderboard
    ├── Achievements
    └── Profile
```

### Bottom Navigation (7 tabs → 5 tabs utama)

```
Bottom Nav:
├── 🏠 Home (Dashboard)
├── 📸 Scan
├── 🎯 Quiz
├── 📚 Learn
└── 👤 Profile

Drawer/Menu:
├── 🏆 Leaderboard
├── 🎖️ Achievements
├── 📊 Statistics
├── ⚙️ Settings
└── 🚪 Logout
```

---

## 📊 Fitur Detail

### 1. 🔐 Authentication (Anggota 1)

**Login Page:**
- Email & password
- "Remember me" checkbox
- Forgot password
- Social login (Google)
- Register link

**Register Page:**
- Name, email, password
- Confirm password
- Terms & conditions
- Avatar selection
- Auto-login after register

**Profile Page:**
- User info (name, email, avatar)
- Statistics:
  - Total scans
  - Total quiz taken
  - Total points
  - Current rank
- Edit profile button
- Logout button

**Tech Stack:**
- Firebase Authentication
- SharedPreferences untuk session
- Image picker untuk avatar

---

### 2. 📸 Scan Feature (Anggota 2)

**Scan Page:**
- Camera/Gallery picker
- Image preview
- Model selector (Hayyin/Naufal)
- Identify button
- Result with:
  - Leaf name
  - Emoji
  - Shape info
  - Fun fact
  - Audio button
  - Save to history

**Scan History:**
- List of past scans
- Date & time
- Leaf name & image
- Delete option
- Export to PDF/Image
- Filter by date

**Points:**
- +10 points per scan
- +5 bonus for new leaf type
- +20 for daily streak

---

### 3. 🎯 Quiz Feature (Anggota 3)

**Quiz Types:**

1. **Multiple Choice**
   ```
   Q: Apa fungsi utama daun?
   A) Fotosintesis ✓
   B) Menyimpan air
   C) Menyerap nutrisi
   D) Reproduksi
   ```

2. **True/False**
   ```
   Q: Daun hijau karena klorofil
   A) Benar ✓
   B) Salah
   ```

3. **Image Quiz**
   ```
   [Gambar Daun]
   Q: Ini daun apa?
   A) Mangga ✓
   B) Jambu
   C) Pepaya
   D) Singkong
   ```

**Quiz Flow:**
1. Select difficulty (Easy/Medium/Hard)
2. 10 questions per quiz
3. Timer: 30 seconds per question (optional)
4. Show result after each question
5. Final score & explanation
6. Share result

**Points:**
- Easy: +5 per correct
- Medium: +10 per correct
- Hard: +15 per correct
- Perfect score bonus: +50

---

### 4. 🏆 Leaderboard (Anggota 4)

**Leaderboard Types:**

1. **Global Leaderboard**
   - Top 100 users
   - All-time ranking
   - Points-based

2. **Weekly Leaderboard**
   - Reset every Monday
   - Weekly champions
   - Special badges

3. **Friends Leaderboard**
   - Compare with friends
   - Private competition
   - Friend challenges

**Ranking Display:**
```
┌─────────────────────────────┐
│ 🥇 1. John Doe    2,450 pts │
│ 🥈 2. Jane Smith  2,100 pts │
│ 🥉 3. Bob Wilson  1,890 pts │
│ 4️⃣  4. You        1,650 pts │
│ 5️⃣  5. Alice      1,500 pts │
└─────────────────────────────┘
```

**Points System:**
- Scan: +10 points
- Quiz correct: +5-15 points
- Achievement: +50-200 points
- Daily login: +5 points
- Weekly streak: +100 points

---

### 5. 📚 Learn & Achievements (Anggota 5)

**Learn Topics (8+):**
1. Fotosintesis
2. Bagian-bagian daun
3. Kenapa daun hijau
4. Kenapa daun gugur
5. Manfaat daun
6. Stomata
7. Warna-warni daun
8. Daun yang bisa dimakan
9. **NEW:** Bentuk daun (menjari, sejajar, dll)
10. **NEW:** Daun di berbagai negara

**Achievements (10+):**

**Scan Achievements:**
- 🌱 Pemula (1 scan)
- 🌿 Penjelajah (5 scans)
- 🍃 Ahli Daun (10 scans)
- 🌳 Master Botanis (25 scans)
- 🏆 Legenda Hijau (50 scans)

**Quiz Achievements:**
- 🎯 Quiz Newbie (1 quiz)
- 🎓 Quiz Master (10 quizzes)
- 🧠 Genius (Perfect score 5x)

**Points Achievements:**
- 💎 Bronze (100 points)
- 💎 Silver (500 points)
- 💎 Gold (1000 points)
- 💎 Platinum (5000 points)

---

## 🗄️ Database Structure

### Users Collection
```json
{
  "uid": "user123",
  "name": "John Doe",
  "email": "john@example.com",
  "avatar": "url",
  "points": 1650,
  "rank": 4,
  "totalScans": 25,
  "totalQuizzes": 10,
  "achievements": ["pemula", "penjelajah"],
  "createdAt": "2024-12-09",
  "lastLogin": "2024-12-09"
}
```

### Scans Collection
```json
{
  "scanId": "scan123",
  "userId": "user123",
  "leafName": "Mangga",
  "imageUrl": "url",
  "model": "hayyin",
  "points": 10,
  "timestamp": "2024-12-09 10:30:00"
}
```

### Quiz Results Collection
```json
{
  "quizId": "quiz123",
  "userId": "user123",
  "difficulty": "medium",
  "score": 8,
  "totalQuestions": 10,
  "points": 80,
  "timestamp": "2024-12-09 11:00:00"
}
```

### Leaderboard Collection
```json
{
  "userId": "user123",
  "name": "John Doe",
  "avatar": "url",
  "points": 1650,
  "rank": 4,
  "weeklyPoints": 250,
  "weeklyRank": 2
}
```

---

## 🔧 Tech Stack

### Frontend
- **Flutter** 3.9.0
- **Dart** 3.0
- **State Management:** Provider/Riverpod

### Backend Options

**Option 1: Firebase (Recommended)**
```yaml
dependencies:
  firebase_core: ^2.24.0
  firebase_auth: ^4.15.0
  cloud_firestore: ^4.13.0
  firebase_storage: ^11.5.0
```

**Option 2: Custom Backend**
- Flask/FastAPI (Python)
- PostgreSQL/MongoDB
- JWT Authentication

### Additional Packages
```yaml
dependencies:
  # Existing
  flutter_animate: ^4.5.0
  confetti: ^0.7.0
  audioplayers: ^5.2.1
  flutter_tts: ^3.8.5
  shared_preferences: ^2.2.2
  image_picker: ^0.8.7+4
  http: ^1.1.0
  
  # New
  firebase_core: ^2.24.0
  firebase_auth: ^4.15.0
  cloud_firestore: ^4.13.0
  firebase_storage: ^11.5.0
  google_sign_in: ^6.1.5
  provider: ^6.1.1
  cached_network_image: ^3.3.0
  fl_chart: ^0.65.0  # For statistics charts
  share_plus: ^7.2.1  # Share quiz results
```

---

## 📅 Timeline Update (4 Minggu)

### Week 1: Setup & Auth
**Anggota 1:**
- [ ] Setup Firebase
- [ ] Login/Register UI
- [ ] Authentication logic
- [ ] Profile page

**Anggota 2-5:**
- [ ] Setup project structure
- [ ] Create models
- [ ] Setup services

### Week 2: Core Features
**Anggota 2:**
- [ ] Scan feature
- [ ] Scan history
- [ ] API integration

**Anggota 3:**
- [ ] Quiz UI
- [ ] Quiz logic
- [ ] Quiz data

**Anggota 4:**
- [ ] Leaderboard UI
- [ ] Points system
- [ ] Ranking logic

**Anggota 5:**
- [ ] Learn page
- [ ] Achievements page
- [ ] Notifications

### Week 3: Integration
**All Members:**
- [ ] Integrate features
- [ ] Connect to Firebase
- [ ] Test all flows
- [ ] Fix bugs

### Week 4: Polish & Present
**All Members:**
- [ ] UI/UX polish
- [ ] Performance optimization
- [ ] Documentation
- [ ] Presentation prep

---

## 🎯 Success Metrics

### User Engagement
- Daily active users
- Average session time
- Scans per user
- Quizzes completed
- Leaderboard views

### Technical
- App size: <25 MB
- Startup time: <3 seconds
- API response: <2 seconds
- Crash-free rate: >99%

### Educational
- Quiz completion rate
- Learn page views
- Achievement unlock rate
- User retention

---

## 💡 Bonus Features (If Time Permits)

### Social Features
- Share scan results
- Share quiz scores
- Friend system
- Comments on scans

### Advanced Features
- AR view of leaves
- Offline mode
- Dark mode
- Multi-language
- Voice commands

### Monetization (Future)
- Premium features
- Remove ads
- Exclusive content
- Custom avatars

---

## 🎓 Untuk Presentasi

### Slide: Enhanced Features

```
LEAF EXPLORER - ENHANCED VERSION

🔐 Authentication & Profile (Anggota 1)
   ├─ Login/Register
   ├─ User Profile
   └─ Statistics

📸 Scan & History (Anggota 2)
   ├─ Image Recognition
   ├─ Scan History
   └─ Points System

🎯 Interactive Quiz (Anggota 3)
   ├─ Multiple Choice
   ├─ True/False
   └─ Image Quiz

🏆 Leaderboard (Anggota 4)
   ├─ Global Ranking
   ├─ Weekly Competition
   └─ Points System

📚 Learn & Achievements (Anggota 5)
   ├─ Educational Content
   ├─ Achievement System
   └─ Gamification
```

### Value Proposition

> "Dengan fitur login, setiap anak punya akun pribadi untuk track progress mereka.
> Quiz membuat pembelajaran lebih interaktif dan fun.
> Leaderboard menciptakan kompetisi sehat antar teman.
> Semua ini membuat anak-anak lebih termotivasi untuk belajar tentang daun!"

---

**Version**: 3.0.0 - Enhanced Edition
**Features**: 7 Major Features
**Team Size**: 5 Members
**Timeline**: 4 Weeks
**Last Updated**: December 9, 2024
