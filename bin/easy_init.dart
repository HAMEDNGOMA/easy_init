import 'dart:io';
import 'package:args/args.dart';
import 'package:easy_init/create_core/create_core.dart';
import 'package:easy_init/create_feature/create_feature.dart';

void main(List<String> arguments) {
  final parser =
      ArgParser()
        ..addCommand('create-feature')
        ..addCommand('create-core')
        ..addCommand('add-package')
        ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help menu');

  final argResults = parser.parse(arguments);

  if (argResults['help'] || arguments.isEmpty) {
    printHelp();
    return;
  }

  final command = argResults.command;
  if (command == null) {
    print('⚠️ Unknown command. Use --help to see available commands.');
    return;
  }

  switch (command.name) {
    case 'create-feature':
      if (command.rest.isEmpty) {
        print('❌ Usage: create-feature <feature_name>');
        return;
      }
      createFeature(command.rest.first);
      break;
    case 'add-package':
      if (command.rest.isEmpty) {
        print('❌ Usage: add-package <package_name>');
        return;
      }
      addPackage(command.rest.first);
      break;

    case 'create-core':
      createCore();
      break;
    default:
      print('❌ Unknown command "${command.name}"');
      printHelp();
  }
}

void printHelp() {
  print('''
🛠️  Dart Easy Init  CLI
A tool to speed up your Dart/Flutter development.

- Available commands:

  create-feature <name>   🔧 Create a new feature folder with Clean Architecture structure
  add-package <name>      📦 Add a Dart/Flutter package to pubspec.yaml
  create-core            🏗️  Create a core folder with common utilities and constants

-Flags:

  -h, --help              Show this help menu

Examples:

  dart run bin/easy_init.dart create-feature auth
  dart run bin/easy_init.dart add-package flutter_bloc
''');
}

void addPackage(String packageName) {
  final result = Process.runSync('flutter', ['pub', 'add', packageName]);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}

String _capitalize(String str) => str[0].toUpperCase() + str.substring(1);
