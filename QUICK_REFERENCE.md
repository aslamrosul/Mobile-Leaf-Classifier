# 📋 Quick Reference - Leaf Explorer

## 🎯 Siapa Mengerjakan Apa?

### 👤 Anggota 1 (Team Lead)
```
📁 core/constants/
   ├── app_colors.dart
   ├── app_constants.dart
   └── data/fun_facts.dart

📁 core/theme/
   └── app_theme.dart

📁 core/utils/
   └── helpers.dart

📄 main.dart (integration)
```
**Waktu:** 10 jam | **Role:** Team Lead

---

### 👤 Anggota 2 (Services)
```
📁 shared/services/
   ├── api_service.dart
   ├── audio_service.dart
   └── storage_service.dart

📁 shared/models/
   ├── leaf_model.dart
   ├── achievement_model.dart
   └── scan_result_model.dart

📁 shared/widgets/
   ├── custom_button.dart
   └── loading_indicator.dart

📁 core/constants/data/
   └── leaf_data.dart
```
**Waktu:** 10 jam | **Role:** Backend Integration

---

### 👤 Anggota 3 (Main Feature)
```
📁 features/splash/
   ├── splash_screen.dart
   └── splash_controller.dart

📁 features/scan/
   ├── scan_page.dart
   ├── scan_controller.dart
   └── widgets/
       ├── image_preview.dart
       ├── prediction_card.dart
       ├── action_buttons.dart
       └── model_selector.dart
```
**Waktu:** 12 jam | **Role:** Main Feature Developer

---

### 👤 Anggota 4 (Learn)
```
📁 features/learn/
   ├── learn_page.dart
   ├── learn_controller.dart
   └── widgets/
       ├── learn_card.dart
       └── lesson_detail.dart

📁 core/constants/data/
   └── learn_data.dart
```
**Waktu:** 8 jam | **Role:** Educational Content

---

### 👤 Anggota 5 (Achievements)
```
📁 features/achievements/
   ├── achievements_page.dart
   ├── achievements_controller.dart
   └── widgets/
       ├── achievement_card.dart
       └── progress_indicator.dart

📁 shared/widgets/
   └── achievement_notification.dart

📁 core/constants/data/
   └── achievement_data.dart
```
**Waktu:** 8 jam | **Role:** Gamification

---

## 📅 Timeline (3 Minggu)

### Week 1: Setup & Core
```
Day 1-2: Anggota 1 - Setup structure & core
Day 2-3: Anggota 2 - Create services
Day 3-4: Review & merge to develop
```

### Week 2: Features
```
Day 1-3: Parallel development
  ├── Anggota 3: Splash & Scan
  ├── Anggota 4: Learn
  └── Anggota 5: Achievements

Day 4-5: Anggota 1 - Integration
Day 6: All - Testing & polish
```

### Week 3: Final
```
Day 1-2: Testing & bug fixes
Day 3: Documentation
Day 4: Presentation prep
```

---

## 🔄 Git Commands Cheat Sheet

### Setup (Pertama kali)
```bash
# Clone repo
git clone <repo-url>
cd PBL_SMS5

# Create your branch
git checkout -b feature/your-feature
```

### Daily Work
```bash
# Pull latest changes
git pull origin develop

# Check status
git status

# Add changes
git add .

# Commit
git commit -m "feat: add feature X"

# Push
git push origin feature/your-feature
```

### Create Pull Request
1. Go to GitHub
2. Click "New Pull Request"
3. Base: `develop` ← Compare: `feature/your-feature`
4. Add description
5. Request review from Anggota 1
6. Wait for approval

---

## 📞 Communication

### Daily Standup (9:00 AM)
**Format:**
- What I did yesterday
- What I'll do today
- Any blockers

**Duration:** 15 minutes

### Weekly Review (Friday 4:00 PM)
**Format:**
- Demo progress
- Discuss challenges
- Plan next week

**Duration:** 1 hour

### Tools
- 💬 WhatsApp - Daily chat
- 🐙 GitHub - Code & issues
- 📹 Google Meet - Video calls
- 📋 Trello - Task tracking

---

## ✅ Checklist Sebelum Push

- [ ] Code berjalan tanpa error
- [ ] No linting warnings
- [ ] Test di device/emulator
- [ ] Add comments untuk code kompleks
- [ ] Update imports jika perlu
- [ ] Commit message jelas

---

## 🐛 Troubleshooting

### Conflict saat merge?
```bash
git pull origin develop
# Fix conflicts manually
git add .
git commit -m "fix: resolve merge conflicts"
git push
```

### Salah commit?
```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

### Mau lihat perubahan?
```bash
git diff
git log --oneline
```

---

## 📚 File Templates

### Dart File Header
```dart
/// [File Name]
/// 
/// [Description]
/// 
/// Features:
/// - Feature 1
/// - Feature 2
/// 
/// Author: [Your Name]
/// Date: [Date]
```

### Commit Message Format
```
feat: add new feature
fix: fix bug in X
docs: update documentation
style: format code
refactor: refactor X
test: add tests
chore: update dependencies
```

---

## 🎯 Success Criteria

### Code Quality
- ✅ No errors
- ✅ No warnings
- ✅ Documented
- ✅ DRY principle
- ✅ SOLID principles

### Features
- ✅ All working
- ✅ Smooth animations
- ✅ Fast response
- ✅ Error handling
- ✅ User-friendly

### Team
- ✅ Equal contribution
- ✅ Good communication
- ✅ On-time delivery
- ✅ Code reviewed
- ✅ Documented

---

## 📊 Progress Tracking

### Anggota 1
- [ ] Setup structure
- [ ] Core constants
- [ ] Core theme
- [ ] Integration
- [ ] Documentation

### Anggota 2
- [ ] API service
- [ ] Audio service
- [ ] Storage service
- [ ] Models
- [ ] Shared widgets

### Anggota 3
- [ ] Splash screen
- [ ] Scan page
- [ ] Scan widgets
- [ ] Integration
- [ ] Testing

### Anggota 4
- [ ] Learn data
- [ ] Learn page
- [ ] Learn widgets
- [ ] Animations
- [ ] Testing

### Anggota 5
- [ ] Achievement data
- [ ] Achievements page
- [ ] Achievement widgets
- [ ] Notification
- [ ] Testing

---

## 💡 Quick Tips

### Anggota 1
- Review code daily
- Help others when stuck
- Keep documentation updated

### Anggota 2
- Test services independently
- Write clear API docs
- Handle errors gracefully

### Anggota 3
- Focus on UX
- Test with different images
- Optimize performance

### Anggota 4
- Make content engaging
- Use animations wisely
- Test on different screens

### Anggota 5
- Make unlocking satisfying
- Test edge cases
- Polish animations

---

## 🚨 Emergency Contacts

**Team Lead (Anggota 1):**
- WhatsApp: [Number]
- Email: [Email]

**Backup (Anggota 2):**
- WhatsApp: [Number]
- Email: [Email]

---

## 📖 Documentation Links

- [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) - Struktur lengkap
- [TEAM_DIVISION_5_MEMBERS.md](TEAM_DIVISION_5_MEMBERS.md) - Detail pembagian
- [REORGANIZATION_GUIDE.md](REORGANIZATION_GUIDE.md) - Cara reorganisasi
- [PRESENTATION_GUIDE.md](PRESENTATION_GUIDE.md) - Panduan presentasi

---

**Quick Reference Version**: 1.0
**Team Size**: 5 Members
**Last Updated**: December 9, 2024

---

💡 **Tip:** Bookmark halaman ini untuk referensi cepat!
