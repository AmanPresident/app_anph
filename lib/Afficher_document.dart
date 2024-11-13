import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart'; 
import 'database_helper.dart'; 

class DocumentList extends StatefulWidget {
  @override
  _DocumentListState createState() => _DocumentListState();
}

class _DocumentListState extends State<DocumentList> {
 

  @override
  void initState() {
    super.initState();
    
  }

  // Fonction pour récupérer les documents de la base de données
  

  
Future<String?> _getDocumentPath() async {
    final documents = await DatabaseHelper.instance.getDocumentsByName('Passport.pdf');
    if (documents.isNotEmpty) {
      return documents[0]['filePath'];
    } else {
      return null; // Aucun document trouvé
    }
  }
void _openDocument() async {
    final filePath = await _getDocumentPath();
    if (filePath != null) {
      OpenFile.open(filePath); // Utilise OpenFile pour ouvrir le PDF
    } else {
      // Si le document n'existe pas
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Document non trouvé')));
    }
  }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document PDF'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openDocument, // Appel à la fonction pour ouvrir le document
          child: Text('Ouvrir le document Passport.pdf'),
        ),
      ),
    );
  }
}