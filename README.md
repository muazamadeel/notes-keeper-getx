# Notes Keeper (GetX) 📚

A **feature‑rich**, **well‑architected** Flutter note‑taking app built with **GetX** for state management and navigation.  
It demonstrates clean project structure, theming, persistence, and a polished UI that can serve as a starter template for your own Flutter applications.

---

## Table of Contents
- [Features](#features)

- [Architecture Overview](#architecture-overview)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

---

## Features
- **GetX** for reactive state management, dependency injection, and route handling.
- **Hive** local database for offline‑first note storage.
- Dark / Light theme with smooth transitions.
- Rich text editing with markdown preview.
- Search & filter notes in real‑time.
- Swipe‑to‑delete with undo Snackbar.
- Responsive layout for phones and tablets.
- Internationalization (i18n) ready – English + Urdu out of the box.

---

## Architecture Overview
```
lib/
├─ data/                # Repository, models, and Hive adapters
│   ├─ models/          # Note model
│   └─ repositories/    # NoteRepository (CRUD operations)
├─ modules/             # GetX feature modules
│   ├─ home/            # HomeController, HomeView
│   └─ edit/            # EditController, EditView
├─ routes/              # AppPages (named routes)
├─ theme/               # Light/Dark ThemeData
└─ main.dart            # App entry point
```
- **Separation of concerns** – UI (Views) ↔︎ Logic (Controllers) ↔︎ Data (Repositories).
- **Dependency injection** via `Get.put()` in `main.dart`.
- **Modular routing** using `GetPage`.

---

## Installation
```bash
# 1. Clone the repository
git clone https://github.com/muazamadeel/notes-keeper-getx.git
cd notes-keeper-getx

# 2. Install Flutter (if not already installed)
# Follow https://flutter.dev/docs/get-started/install

# 3. Get Dart packages
flutter pub get

# 4. Generate Hive adapters (if you modify models)
flutter packages pub run build_runner build --delete-conflicting-outputs
```

---

## Running the App
```bash
# Launch on an emulator or connected device
flutter run
```
For a release build:
```bash
flutter build apk   # Android
flutter build ios   # iOS (requires macOS)
```

---

## Testing
```bash
# Unit & widget tests
flutter test
```
The project includes a small test suite covering the NoteRepository and HomeController logic.

---

## Contributing
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/awesome-feature`).
3. Write tests for your changes.
4. Ensure `flutter format .` passes linting.
5. Submit a Pull Request with a clear description of the change.

---

## License
Distributed under the **MIT License**. See `LICENSE` for more information.

---

*Made with ❤️ by [Muazam Adeel](https://github.com/muazamadeel)*
