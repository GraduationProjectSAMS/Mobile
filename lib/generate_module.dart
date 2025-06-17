// ignore_for_file: type=lint
import 'dart:developer';
import 'dart:io';

void main() {
  stdout.write('Enter module name (e.g., chat_logs): ');
  final String? moduleName = stdin.readLineSync();
  if (moduleName == null || moduleName.isEmpty) {
    log('❌ Module name cannot be empty.');
    return;
  }

  final formattedClassName = normalizeClassName(moduleName); // Class name
  final formattedFileName = normalizeFileName(moduleName); // File name

  final modulePath = 'lib/features/$moduleName';
  final domainPath = '$modulePath/domain';
  final dataPath = '$modulePath/data';
  final presentationPath = '$modulePath/presentation';

  final folders = [
    '$domainPath/repositories',
    '$domainPath/entities',
    '$domainPath/use_cases',
    '$dataPath/data_sources',
    '$dataPath/models',
    '$dataPath/repositories',
    '$presentationPath/manager',
    '$presentationPath/screens',
    '$presentationPath/widgets',
  ];

  final files = {
    '$domainPath/repositories/${formattedFileName}_repo.dart': '''
abstract class ${formattedClassName}Repo {
  // Define methods here
}
''',
    '$dataPath/data_sources/${formattedFileName}_remote_repo.dart': '''
abstract class ${formattedClassName}RemoteRepo {
  // Define remote data source methods here
}
''',
    '$dataPath/data_sources/${formattedFileName}_remote_repo_impl.dart': '''
import '${formattedFileName}_remote_repo.dart';
import '../../../../core/utilities/services/api_service.dart';

class ${formattedClassName}RemoteRepoImpl implements ${formattedClassName}RemoteRepo {
  final ApiService apiService;

  ${formattedClassName}RemoteRepoImpl(this.apiService);

  // Implement methods here
}
''',
    '$dataPath/repositories/${formattedFileName}_repo_impl.dart': '''
import '../../domain/repositories/${formattedFileName}_repo.dart';
import '../data_sources/${formattedFileName}_remote_repo.dart';

class ${formattedClassName}RepoImpl implements ${formattedClassName}Repo {
  final ${formattedClassName}RemoteRepo remoteRepo;

  ${formattedClassName}RepoImpl(this.remoteRepo);

  // Implement repository methods here
}
''',
    '$presentationPath/screens/${formattedFileName}_screen.dart': '''
import 'package:flutter/material.dart';
import '../widgets/${formattedFileName}_screen_body.dart';

class ${formattedClassName}Screen extends StatelessWidget { 
  const ${formattedClassName}Screen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const Scaffold( 
      body: ${formattedClassName}ScreenBody(), 
    );
  }
}
''',
    '$presentationPath/widgets/${formattedFileName}_screen_body.dart': '''
import 'package:flutter/material.dart';

class ${formattedClassName}ScreenBody extends StatelessWidget { 
  const ${formattedClassName}ScreenBody({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
'''
  };

  createFolders(folders);
  generateFiles(files);
  updateDependencyInjection(formattedClassName, formattedFileName);

  log('✅ Module "$moduleName" structure has been generated and registered successfully!');
}

void createFolders(List<String> folders) {
  for (var folder in folders) {
    Directory(folder).createSync(recursive: true);
    log('📂 Created folder: $folder');
  }
}

void generateFiles(Map<String, String> files) {
  files.forEach((filePath, content) {
    final file = File(filePath);
    if (!file.existsSync()) {
      file.createSync();
      file.writeAsStringSync(content);
      log('📝 Created: $filePath');
    } else {
      log('⚠️ File already exists: $filePath');
    }
  });
}

// Converts "chat_logs" to "Chatlogs"
String normalizeClassName(String name) {
  final List<String> parts = name.split('_');
  return parts.map((e) => e[0].toUpperCase() + e.substring(1)).join();
}

// Converts "chat_logs" to "chat_logs"
String normalizeFileName(String name) {
  return name.toLowerCase();
}

void updateDependencyInjection(String className, String fileName) {
  const filePath = 'lib/core/utilities/functions/dependency_injection.dart';
  final file = File(filePath);

  if (!file.existsSync()) {
    log('⚠️ dependency_injection.dart not found, skipping registration.');
    return;
  }

  String content = file.readAsStringSync();

  // Check if the repository is already registered
  if (content.contains('${className}RepoImpl')) {
    log('⚠️ Repository already registered in dependency_injection.dart.');
    return;
  }

  // Prepare import statements
  final String newImports = '''
import 'package:learnovia_mobile/features/$fileName/data/data_sources/${fileName}_remote_repo_impl.dart';
import 'package:learnovia_mobile/features/$fileName/data/repositories/${fileName}_repo_impl.dart';''';

  // Insert new imports at the top of the file if they don't already exist
  if (!content.contains(newImports.trim())) {
    content = content.replaceFirst('import \'package:dio/dio.dart\';',
        'import \'package:dio/dio.dart\';\n$newImports');
  }

  // Find the last `getIt.registerLazySingleton` statement
  final RegExp lastRepoRegistration =
      RegExp(r'getIt\.registerLazySingleton<.*>\(.*\);');
  final Iterable<RegExpMatch> matches =
      lastRepoRegistration.allMatches(content);

  if (matches.isNotEmpty) {
    final RegExpMatch lastMatch = matches.last;
    final int insertPosition = lastMatch.end;

    // Prepare the new repository registration
    final String newRepoRegistration = '''
  getIt.registerLazySingleton<${className}RepoImpl>(()=> ${className}RepoImpl(${className}RemoteRepoImpl(getIt.get<ApiService>())));''';

    // Insert the new repository registration after the last one found
    content =
        '${content.substring(0, insertPosition)}\n$newRepoRegistration${content.substring(insertPosition)}';
  } else {
    // Fallback: If no `getIt.registerLazySingleton` is found, add at the end of the setup method
    final String newRepoRegistration = '''
  getIt.registerLazySingleton<${className}RepoImpl>(()=> ${className}RepoImpl(${className}RemoteRepoImpl(getIt.get<ApiService>())));''';

    content = content.replaceFirst(
        'void setup() {', 'void setup() {\n$newRepoRegistration');
  }

  file.writeAsStringSync(content);
  log('🔗 Registered ${className}RepoImpl and added imports in dependency_injection.dart');
}
