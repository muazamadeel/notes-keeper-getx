# 📝 Notes Keeper (GetX + SQFlite + Firebase)

A professional, high-performance Notes Management application built with **Flutter**, utilizing **GetX** for state management and a hybrid database approach (**SQFlite** for local persistence and **Firebase Firestore** for cloud synchronization).

---

## 🚀 Overview

**Notes Keeper** is designed to provide a seamless note-taking experience with offline-first capabilities. Whether you're offline or online, your notes are always accessible and securely backed up.

### ✨ Key Features
- **Offline First:** Uses **SQFlite** for lightning-fast local storage.
- **Cloud Sync:** Real-time synchronization with **Firebase Firestore**.
- **State Management:** Powered by **GetX** for reactive and efficient performance.
- **Priority Management:** Organize your notes based on importance (High, Low).
- **Responsive Design:** Integrated with **Device Preview** for testing across multiple screen sizes.
- **Clean Architecture:** Well-structured codebase following best practices.

---

## 📸 Screenshots

| Home Screen | Add Note | Note Details |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/df80e0e1-1fcc-4c7e-824e-207680a9b79b" width="250"> | <img src="https://github.com/user-attachments/assets/acf6fdcf-e03b-4724-ab3c-3fe692c67124" width="250"> | <img src="https://github.com/user-attachments/assets/bdee1d6b-75d2-49c0-b567-17f053ccf53c" width="250"> |

---

## 🛠️ Tech Stack

- **Framework:** Flutter
- **State Management:** GetX
- **Local Database:** SQFlite
- **Cloud Database:** Cloud Firestore
- **Dependency Injection:** GetX Controllers
- **UI/UX:** Material Design with custom priority colors

---

## 📁 Project Structure

```bash
lib/
├── controller/        # GetX Controllers for Business Logic
├── models/            # Data Models (Note Model)
├── screens/           # UI Screens (List, Detail)
├── services/          # Firebase & External Services
├── database_helper/   # SQFlite Local DB Configuration
└── main.dart          # Entry Point & Firebase Initialization
```

---

## ⚙️ Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/muazamadeel/notes-keeper-getx.git
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration:**
   - Create a project on 
   - Add an Android/iOS app.
   - Download `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place them in the respective directories.

4. **Run the app:**
   ```bash
   flutter run
   ```

---

## 🤝 Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request.


---
*Developed with ❤️ by Muazam Adeel*
