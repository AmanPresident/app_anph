import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'database_helper.dart'; // Importez la classe DatabaseHelper ici

class Insertion extends StatefulWidget {
  @override
  _InsertionState createState() => _InsertionState();

  // Fonction statique pour insérer un document PDF
  static Future<void> insertPdfDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      String fileName = result.files.single.name;

      await DatabaseHelper.instance.insertDocument(fileName, filePath);
      print("Document inséré avec succès: $fileName");
    } else {
      print("Aucun fichier sélectionné.");
    }
  }
}

class _InsertionState extends State<Insertion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un document PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: Insertion.insertPdfDocument,
          child: Text('Sélectionner et insérer un PDF'),
        ),
      ),
    );
  }
}
