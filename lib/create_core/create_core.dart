import 'dart:io';

void createCore() {
  final basePath = "lib/core"; // ✅ fixed typo (baseBath -> basePath)

  final folders = [
    "constants",
    "errors",
    "extensions",
    "network",
    "utils",
    "widgets",
  ];

  // Create folders
  for (final folder in folders) {
    final path = "$basePath/$folder";
    Directory(path).createSync(recursive: true);
    print("📁 Created: $path");
  }

  // Create a sample constants file
  final constantsFile = File("$basePath/constants/app_constants.dart");
  constantsFile.writeAsStringSync('''
class AppConstants {
  static const String baseUrl = 'https://api.example.com';
  static const Duration timeout = Duration(seconds: 30);
}
''');
  print("✅ Created: ${constantsFile.path}");
}
