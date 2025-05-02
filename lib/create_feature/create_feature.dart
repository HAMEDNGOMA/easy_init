import 'dart:io';

void createFeature(String name) {
  final basePath = 'lib/features/$name';
  final folders = [
    'data/datasources',
    'data/models',
    'data/repositories',
    'domain/entities',
    'domain/repositories',
    'domain/usecases',
    'presentation/cubit',
    'presentation/pages',
    'presentation/widgets',
  ];

  for (final folder in folders) {
    final path = '$basePath/$folder';
    Directory(path).createSync(recursive: true);
    print('📁 Created: $path');
  }

  final entityFile = File('$basePath/domain/entities/${name}_entity.dart');
  entityFile.writeAsStringSync('''
class ${_capitalize(name)}Entity {
  final int id;
  final String name;

  const ${_capitalize(name)}Entity({required this.id, required this.name});
}
''');
  print('✅ Entity file generated.');
}

String _capitalize(String str) => str[0].toUpperCase() + str.substring(1);
