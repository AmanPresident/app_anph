import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart'; 
import '../database_helper.dart'; 
import '../Appbar.dart'; 
import '../bottom_navigation_bar.dart';


class Passeport extends StatelessWidget {
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
    } 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: CustomAppBar(
          
          title: "PASSEPORT",  
        ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "De quoi s'agit-il ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
            "Un passeport est un document de circulation délivré par le Gouvernement à ses citoyens. Cette pièce d'identé permet à son porteur de voyager à l'étranger."
"Toute personne sollicitant l'entrée dans un pays autre que le sien, comme touriste, étudiant ou travailleur, doit remplir certaines formalités et solliciter une autorisation."
"Pour franchir une frontière le passeport est généralement requis, souvent couplé à un visa."
"Depuis le 02 Février 2017, tous les passeports qui sont délivrés sont des passeports biométriques."
"Ils contiennent des données relatives à l'état civil et sont incrustés d'une puce électronique contenant l'image numérisée des empreintes digitales."
"(Décret N° 2017-053/PR/MI portant sur la mise en circulation de passeport ordinaire biométrique). "),
            SizedBox(height: 16),
            Text(
              "À qui s’adresser ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Direction de l'Immigration et des Renseignements Généraux."),
            SizedBox(height: 16),
            Text(
              "Condition à remplir et document à fournir :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Être de nationalité Djiboutienne\n"
              "- Pour les mineurs : acte de naissance et autorisation parentale\n"
              "- 2 Photos (35x45 mm)\n"
              "- Copie des pièces d\’identités des parents.\n"
              "- Les adultes doivent présenter une carte d\’identité nationale\n"
              "- Les étudiants : un certificat de scolarit\n"
              "- Les employés et les fonctionnaires : un certificat de travail\n",
            ),
            SizedBox(height: 16),
            Text(
              "Frais occasionnés :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Un timbre de 15 000 DJF"),
            SizedBox(height: 16),
            Text(
              "Horaires et jours de dépôt :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("8h à 17h du Dimanche au Jeudi"),
            SizedBox(height: 16),
            Text(
              "Délais après dépôt :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("3 jour"),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _openDocument();
              },
              icon: Icon(Icons.print),
              label: Text("IMPRIMER FORMULAIRE EN PDF"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}