# ⚡ easy_init

A simple, powerful Dart CLI tool to quickly scaffold features, core structure, and add packages for your **Flutter** or **Dart** projects.

> 🚀 Build faster. Stay consistent. Initialize with ease.

---

## 📦 Installation

### 🔹 Clone & Run Locally

```bash
git clone https://github.com/HAMEDNGOMA/easy_init.git
cd easy_init
dart pub get
```

Run using:

```bash
dart run bin/easy_init.dart <command>
```

---

### 🔹 (Optional) Install Globally

Make it available from anywhere on your machine:

```bash
dart pub global activate --source git https://github.com/HAMEDNGOMA/easy_init.git
```

Then run it like this:

```bash
easy_init create-feature auth
```

> ✅ Make sure Dart's global bin path is in your system's `PATH`:
> - macOS/Linux: `~/.pub-cache/bin`
> - Windows: `%APPDATA%\Pub\Cache\bin`

---

## 🚀 Usage

Run:

```bash
easy_init <command>
```

### 📁 Create a Feature

```bash
easy_init create-feature profile
```

This will generate:

```
lib/features/profile/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── cubit/
    ├── pages/
    └── widgets/
```

Includes a basic entity file:
```dart
class ProfileEntity {
  final int id;
  final String name;

  const ProfileEntity({required this.id, required this.name});
}
```

---

### 🧱 Generate Core Structure

```bash
easy_init create-core
```

Creates the following structure:

```
lib/core/
├── constants/
│   └── app_constants.dart
├── errors/
├── extensions/
├── network/
├── utils/
└── widgets/
```

Sample `app_constants.dart`:
```dart
class AppConstants {
  static const String baseUrl = 'https://api.example.com';
  static const Duration timeout = Duration(seconds: 30);
}
```

---

### 📦 Add a Pub Package

```bash
easy_init add-package flutter_bloc
```

This will:
- Add the latest version to `pubspec.yaml`
- Run `flutter pub get`

Optionally specify a version:

```bash
easy_init add-package dio@5.4.0
```

---

## 🧰 Commands Reference

| Command                   | Description                                              |
|---------------------------|----------------------------------------------------------|
| `create-feature <name>`   | Scaffold a clean architecture feature folder             |
| `create-core`             | Create reusable `lib/core/` folder structure             |
| `add-package <name>`      | Add a pub package (supports optional version)            |
| `--help` / `-h`           | Show help menu                                           |

---

## ✅ Example

```bash
easy_init create-feature auth
easy_init create-core
easy_init add-package get_it
```

---

## 🤝 Contributing

Have ideas? Want to improve generators? PRs are welcome!

1. Fork the repo
2. Create a feature branch
3. Submit a pull request

---

## 📄 License

MIT License © [Your Name](https://github.com/HAMEDNGOMA)
