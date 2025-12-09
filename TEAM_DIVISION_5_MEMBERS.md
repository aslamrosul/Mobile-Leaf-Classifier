# 👥 Pembagian Kerja Tim - 5 Anggota

## 🎯 Struktur Tim

```
Tim Leaf Explorer (5 Anggota)
├── Anggota 1 (Team Lead) - Core & Integration
├── Anggota 2 - Shared Services
├── Anggota 3 - Splash & Scan Feature
├── Anggota 4 - Learn Feature
└── Anggota 5 - Achievements Feature
```

---

## 📋 Detail Tanggung Jawab

### 👤 Anggota 1: Team Lead & Core Module

**Role:** Team Lead, Core Developer

**Tanggung Jawab:**
1. **Setup Project Structure**
   - Buat folder structure
   - Setup Git repository
   - Create branches

2. **Core Module**
   - `core/constants/app_colors.dart`
   - `core/constants/app_constants.dart`
   - `core/theme/app_theme.dart`
   - `core/utils/helpers.dart`

3. **Integration & Testing**
   - Integrate semua features
   - Testing keseluruhan
   - Fix integration bugs
   - Code review

4. **Documentation**
   - Update README.md
   - Create API documentation
   - Prepare presentation slides

**Files:**
```
core/
├── constants/
│   ├── app_colors.dart          ← Anggota 1
│   ├── app_constants.dart       ← Anggota 1
│   └── data/
│       └── fun_facts.dart       ← Anggota 1
├── theme/
│   └── app_theme.dart           ← Anggota 1
└── utils/
    └── helpers.dart             ← Anggota 1

main.dart                        ← Anggota 1 (integration)
```

**Estimasi Waktu:** 8-10 jam

---

### 👤 Anggota 2: Shared Services & Models

**Role:** Backend Integration Specialist

**Tanggung Jawab:**
1. **Shared Services**
   - `shared/services/api_service.dart`
   - `shared/services/audio_service.dart`
   - `shared/services/storage_service.dart`

2. **Shared Models**
   - `shared/models/leaf_model.dart`
   - `shared/models/achievement_model.dart`
   - `shared/models/scan_result_model.dart`

3. **Data Constants**
   - `core/constants/data/leaf_data.dart`

4. **Shared Widgets**
   - `shared/widgets/custom_button.dart`
   - `shared/widgets/loading_indicator.dart`

**Files:**
```
shared/
├── services/
│   ├── api_service.dart         ← Anggota 2
│   ├── audio_service.dart       ← Anggota 2 (move & update)
│   └── storage_service.dart     ← Anggota 2
├── models/
│   ├── leaf_model.dart          ← Anggota 2
│   ├── achievement_model.dart   ← Anggota 2
│   └── scan_result_model.dart   ← Anggota 2
└── widgets/
    ├── custom_button.dart       ← Anggota 2
    └── loading_indicator.dart   ← Anggota 2

core/constants/data/
└── leaf_data.dart               ← Anggota 2
```

**Estimasi Waktu:** 8-10 jam

---

### 👤 Anggota 3: Splash & Scan Feature

**Role:** Main Feature Developer

**Tanggung Jawab:**
1. **Splash Feature**
   - `features/splash/splash_screen.dart`
   - `features/splash/splash_controller.dart`

2. **Scan Feature (Main)**
   - `features/scan/scan_page.dart`
   - `features/scan/scan_controller.dart`
   - `features/scan/widgets/image_preview.dart`
   - `features/scan/widgets/prediction_card.dart`
   - `features/scan/widgets/action_buttons.dart`
   - `features/scan/widgets/model_selector.dart`

3. **Integration**
   - Integrate dengan API service
   - Integrate dengan Audio service
   - Handle image picker
   - Handle prediction logic

**Files:**
```
features/
├── splash/
│   ├── splash_screen.dart       ← Anggota 3
│   └── splash_controller.dart   ← Anggota 3
└── scan/
    ├── scan_page.dart           ← Anggota 3
    ├── scan_controller.dart     ← Anggota 3
    └── widgets/
        ├── image_preview.dart   ← Anggota 3
        ├── prediction_card.dart ← Anggota 3
        ├── action_buttons.dart  ← Anggota 3
        └── model_selector.dart  ← Anggota 3
```

**Estimasi Waktu:** 10-12 jam

---

### 👤 Anggota 4: Learn Feature

**Role:** Educational Content Developer

**Tanggung Jawab:**
1. **Learn Feature**
   - `features/learn/learn_page.dart`
   - `features/learn/learn_controller.dart`
   - `features/learn/widgets/learn_card.dart`
   - `features/learn/widgets/lesson_detail.dart`

2. **Learn Data**
   - `core/constants/data/learn_data.dart`

3. **UI/UX**
   - Design learn cards
   - Implement animations
   - Color schemes untuk cards

**Files:**
```
features/learn/
├── learn_page.dart              ← Anggota 4
├── learn_controller.dart        ← Anggota 4
└── widgets/
    ├── learn_card.dart          ← Anggota 4
    └── lesson_detail.dart       ← Anggota 4

core/constants/data/
└── learn_data.dart              ← Anggota 4
```

**Estimasi Waktu:** 6-8 jam

---

### 👤 Anggota 5: Achievements Feature

**Role:** Gamification Developer

**Tanggung Jawab:**
1. **Achievements Feature**
   - `features/achievements/achievements_page.dart`
   - `features/achievements/achievements_controller.dart`
   - `features/achievements/widgets/achievement_card.dart`
   - `features/achievements/widgets/progress_indicator.dart`

2. **Achievement Notification**
   - `shared/widgets/achievement_notification.dart`

3. **Achievement Data**
   - `core/constants/data/achievement_data.dart`

4. **Achievement Logic**
   - Check achievement unlock
   - Progress tracking
   - Notification trigger

**Files:**
```
features/achievements/
├── achievements_page.dart       ← Anggota 5
├── achievements_controller.dart ← Anggota 5
└── widgets/
    ├── achievement_card.dart    ← Anggota 5
    └── progress_indicator.dart  ← Anggota 5

shared/widgets/
└── achievement_notification.dart ← Anggota 5

core/constants/data/
└── achievement_data.dart        ← Anggota 5
```

**Estimasi Waktu:** 6-8 jam

---

## 📊 Timeline & Milestones

### Week 1: Setup & Core (3-4 hari)

**Day 1-2: Setup (Anggota 1)**
- [ ] Create folder structure
- [ ] Setup Git repository
- [ ] Create branches for each member
- [ ] Setup core constants & theme

**Day 2-3: Shared Module (Anggota 2)**
- [ ] Create all services
- [ ] Create all models
- [ ] Create shared widgets
- [ ] Test services independently

**Day 3-4: Review & Merge**
- [ ] Code review
- [ ] Merge core & shared to main
- [ ] All members pull latest code

---

### Week 2: Features Development (5-6 hari)

**Day 1-3: Parallel Development**

**Anggota 3 (Splash & Scan):**
- [ ] Day 1: Splash screen
- [ ] Day 2: Scan page UI
- [ ] Day 3: Scan logic & integration

**Anggota 4 (Learn):**
- [ ] Day 1: Learn data
- [ ] Day 2: Learn page UI
- [ ] Day 3: Learn animations

**Anggota 5 (Achievements):**
- [ ] Day 1: Achievement data
- [ ] Day 2: Achievements page UI
- [ ] Day 3: Achievement notification

**Day 4-5: Integration (Anggota 1)**
- [ ] Integrate all features
- [ ] Test navigation
- [ ] Fix integration bugs

**Day 6: Testing & Polish**
- [ ] All members test
- [ ] Fix bugs
- [ ] Polish UI/UX

---

### Week 3: Testing & Presentation (3-4 hari)

**Day 1-2: Testing**
- [ ] Unit testing
- [ ] Integration testing
- [ ] User testing
- [ ] Bug fixes

**Day 3: Documentation**
- [ ] Update README
- [ ] Code documentation
- [ ] API documentation
- [ ] User guide

**Day 4: Presentation Prep**
- [ ] Create slides
- [ ] Prepare demo
- [ ] Practice presentation
- [ ] Q&A preparation

---

## 🔄 Git Workflow

### Branch Strategy

```
main (production)
├── develop (integration)
│   ├── feature/core-setup (Anggota 1)
│   ├── feature/shared-services (Anggota 2)
│   ├── feature/splash-scan (Anggota 3)
│   ├── feature/learn (Anggota 4)
│   └── feature/achievements (Anggota 5)
```

### Workflow Steps

**1. Create Branch**
```bash
git checkout -b feature/your-feature
```

**2. Work on Feature**
```bash
# Code...
git add .
git commit -m "feat: add feature X"
```

**3. Push to Remote**
```bash
git push origin feature/your-feature
```

**4. Create Pull Request**
- Go to GitHub
- Create PR to `develop`
- Request review from Anggota 1

**5. Code Review**
- Anggota 1 review code
- Request changes if needed
- Approve if good

**6. Merge**
```bash
git checkout develop
git merge feature/your-feature
```

---

## 📞 Communication

### Daily Standup (15 menit)

**Format:**
1. What did you do yesterday?
2. What will you do today?
3. Any blockers?

**Schedule:** Setiap pagi jam 9:00

### Weekly Review (1 jam)

**Format:**
1. Demo progress
2. Discuss challenges
3. Plan next week
4. Code review session

**Schedule:** Setiap Jumat jam 16:00

### Tools

- **WhatsApp Group** - Daily communication
- **GitHub** - Code & issues
- **Google Meet** - Video calls
- **Trello/Notion** - Task management

---

## ✅ Checklist per Anggota

### Anggota 1 (Team Lead)
- [ ] Setup folder structure
- [ ] Create app_colors.dart
- [ ] Create app_constants.dart
- [ ] Create app_theme.dart
- [ ] Create helpers.dart
- [ ] Create fun_facts.dart
- [ ] Integrate all features in main.dart
- [ ] Test integration
- [ ] Fix bugs
- [ ] Code review
- [ ] Update documentation
- [ ] Create presentation slides

### Anggota 2 (Services)
- [ ] Create api_service.dart
- [ ] Move & update audio_service.dart
- [ ] Create storage_service.dart
- [ ] Create leaf_model.dart
- [ ] Create achievement_model.dart
- [ ] Create scan_result_model.dart
- [ ] Create leaf_data.dart
- [ ] Create custom_button.dart
- [ ] Create loading_indicator.dart
- [ ] Test all services
- [ ] Write service documentation

### Anggota 3 (Splash & Scan)
- [ ] Create splash_screen.dart
- [ ] Create splash_controller.dart
- [ ] Create scan_page.dart
- [ ] Create scan_controller.dart
- [ ] Create image_preview.dart
- [ ] Create prediction_card.dart
- [ ] Create action_buttons.dart
- [ ] Create model_selector.dart
- [ ] Integrate with API service
- [ ] Integrate with Audio service
- [ ] Test scan flow
- [ ] Handle edge cases

### Anggota 4 (Learn)
- [ ] Create learn_data.dart
- [ ] Create learn_page.dart
- [ ] Create learn_controller.dart
- [ ] Create learn_card.dart
- [ ] Create lesson_detail.dart
- [ ] Implement animations
- [ ] Test learn page
- [ ] Polish UI/UX

### Anggota 5 (Achievements)
- [ ] Create achievement_data.dart
- [ ] Create achievements_page.dart
- [ ] Create achievements_controller.dart
- [ ] Create achievement_card.dart
- [ ] Create progress_indicator.dart
- [ ] Move & update achievement_notification.dart
- [ ] Implement unlock logic
- [ ] Test achievement flow
- [ ] Test notification

---

## 🎯 Success Metrics

### Code Quality
- [ ] No linting errors
- [ ] All functions documented
- [ ] Meaningful variable names
- [ ] DRY principle followed
- [ ] SOLID principles followed

### Features
- [ ] All features working
- [ ] No critical bugs
- [ ] Smooth animations
- [ ] Fast response time
- [ ] Good error handling

### Team
- [ ] All members contribute equally
- [ ] Good communication
- [ ] On-time delivery
- [ ] Code review done
- [ ] Documentation complete

---

## 💡 Tips untuk Setiap Anggota

### Anggota 1 (Team Lead)
- **Be available** untuk help anggota lain
- **Review code** secara regular
- **Communicate** progress ke semua
- **Prioritize** integration issues
- **Document** decisions

### Anggota 2 (Services)
- **Test services** independently
- **Write clear** API documentation
- **Handle errors** gracefully
- **Make services** reusable
- **Think about** edge cases

### Anggota 3 (Scan)
- **Focus on** user experience
- **Handle loading** states
- **Test with** different images
- **Optimize** image upload
- **Add proper** error messages

### Anggota 4 (Learn)
- **Make content** engaging
- **Use animations** wisely
- **Test readability** on different screens
- **Organize content** logically
- **Add visual** elements

### Anggota 5 (Achievements)
- **Make unlocking** satisfying
- **Test progress** tracking
- **Handle edge** cases
- **Make notification** eye-catching
- **Test on** different scenarios

---

## 📊 Estimasi Total Waktu

| Anggota | Waktu | Persentase |
|---------|-------|------------|
| Anggota 1 (Lead) | 10 jam | 25% |
| Anggota 2 (Services) | 10 jam | 25% |
| Anggota 3 (Scan) | 12 jam | 30% |
| Anggota 4 (Learn) | 8 jam | 20% |
| Anggota 5 (Achievements) | 8 jam | 20% |
| **Total** | **48 jam** | **120%** |

**Note:** Total > 100% karena ada overlap dan parallel work.

**Actual Time:** ~2-3 minggu dengan 5 orang

---

## 🎓 Untuk Presentasi ke Dosen

### Slide: Tim & Pembagian Kerja

```
TIM LEAF EXPLORER (5 Anggota)

Anggota 1 (Team Lead)
├─ Core Module (Colors, Theme, Constants)
├─ Integration & Testing
└─ Documentation & Presentation

Anggota 2 (Backend Integration)
├─ Shared Services (API, Audio, Storage)
├─ Data Models
└─ Shared Widgets

Anggota 3 (Main Features)
├─ Splash Screen
├─ Scan Feature (Image Picker, Prediction)
└─ UI/UX Main Page

Anggota 4 (Educational Content)
├─ Learn Feature
├─ Educational Data
└─ Learning UI/UX

Anggota 5 (Gamification)
├─ Achievements Feature
├─ Achievement Notification
└─ Progress Tracking
```

### Penjelasan untuk Dosen

> "Kami membagi tim menjadi 5 bagian dengan tanggung jawab yang jelas:
> 
> **Anggota 1** sebagai Team Lead menghandle core module dan integration. 
> Dia memastikan semua bagian bisa bekerja sama dengan baik.
> 
> **Anggota 2** fokus ke backend integration, membuat services untuk 
> komunikasi dengan API, audio, dan storage.
> 
> **Anggota 3** mengerjakan main feature yaitu scan dan identifikasi daun, 
> yang merupakan core functionality aplikasi.
> 
> **Anggota 4** membuat konten edukatif di learn page, memastikan 
> anak-anak bisa belajar tentang daun dengan cara yang menarik.
> 
> **Anggota 5** mengimplementasi gamification dengan achievement system 
> untuk memotivasi anak-anak scan lebih banyak daun.
> 
> Dengan pembagian ini, setiap anggota bisa fokus di area masing-masing 
> tanpa conflict, dan kami bisa develop secara parallel untuk efisiensi waktu."

---

**Version**: 2.0.0
**Team Size**: 5 Members
**Last Updated**: December 9, 2024
