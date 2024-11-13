import 'package:flutter/material.dart';
import '../Appbar.dart';
import '../bottom_navigation_bar.dart';

class AttestationAccueil extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "ATTESTATION D'ACCUEIL",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "De quoi s'agit-il ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Une attestation d'accueil est un document indispensable pour toutes personnes souhaitant séjourner à court terme à Djibouti (> 3 mois).\n\n"
              "Ce document est établi par l'hébergeur attestant qu'il accueillera le(s) visiteur(s) à son domicile lors du séjour à Djibouti.",
            ),
            SizedBox(height: 16),
            Text(
              "À qui s’adresser ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("Cabinet de la Préfecture."),
            SizedBox(height: 16),
            Text(
              "Condition à remplir et document à fournir :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "- Demande d'attestation d'accueil\n"
              "- Copie de(s) passeport du/des visiteurs\n"
              "- Copie de la pièce d'identité de l'hébergeant\n"
              "- Bulletin de Paie ou Patente",
            ),
            SizedBox(height: 16),
            Text(
              "Frais occasionnés :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("2 timbres de 1000 DJF"),
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
            Text("1 jour"),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Action pour le bouton "IMPRIMER"
              },
              icon: Icon(Icons.print),
              label: Text("IMPRIMER"),
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
