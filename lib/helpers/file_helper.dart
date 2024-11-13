import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Cette fonction retourne le chemin du répertoire où vous pouvez stocker vos fichiers
Future<String> getFilePath() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
