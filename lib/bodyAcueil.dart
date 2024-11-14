import 'package:flutter/material.dart';
import 'EcranDeux.dart';

import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'identité et famille/AttestationAccueil.dart';
import 'identité et famille/Passport.dart';
import 'identité et famille/Formulaires/FicheConsultation.dart';
import 'Afficher_document.dart';

class BodyAccueil extends StatefulWidget {
  @override
  _BodyAccueilState createState() => _BodyAccueilState();
}

class _BodyAccueilState extends State<BodyAccueil> {
  List<Map<String, dynamic>> allItems = [
    {'Attestation d\'Accueil': 'Title 1', 'screen': AttestationAccueil()},
    {'title': 'Title 2', 'screen': AttestationAccueil()},
    {'title': 'Title 3', 'screen': AttestationAccueil()},
    // Ajoutez tous les titres et leurs écrans de navigation ici
  ];

  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = allItems;
      } else {
        filteredItems = allItems
            .where((item) =>
                item['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void navigateToItem(String query, BuildContext context) {
    final foundItems = allItems.where(
      (item) => item['title'].toLowerCase() == query.toLowerCase(),
    );

    if (foundItems.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => foundItems.first['screen'],
        ),
      );
    } else {
      // Vous pouvez ajouter une action ici si aucun élément n'est trouvé, comme afficher un message d'erreur.
      print("Aucun élément trouvé");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            height: 150.0,
            width: 300.0,
            child: AnotherCarousel(
              images: [
                AssetImage('images/222.jpeg'),
                AssetImage('images/111.jpeg'),
                AssetImage('images/333.jpeg'),
              ],
            )),
        SizedBox(height: 16.0),
        Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ExpansionTile(
              leading: Icon(Icons.security, color: Colors.black87),
              title: Text(
                "Privilèges Handicapé",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                ListTile(
                  title: Text("Reservation Hopital"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EcranDeux()),
                    );
                  },
                ),
              ],
            )),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.family_restroom, color: Colors.blue),
            title: Text(
              "Identité - Famille",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            children: [
              ListTile(
                title: Text("Attestation d'Accueil"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AttestationAccueil()),
                  );
                },
              ),
              ListTile(
                title: Text("Autorisation de l'Accompagnement"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FicheDeConsultation()),
                  );
                },
              ),
              ListTile(
                title: Text("Autorisation parentale d'un enfant mineur"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DocumentList()),
                  );
                },
              ),
              ListTile(
                title: Text("Autorité Parentale"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Carte d'Identité Nationale"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Certificat Administratif"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Certificat de Résidence"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Certificat de vie"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Copie Conforme du Diplôme"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Déclaration de perte des documents"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Légalisation"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Obtention Numéro National d'Identification"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Passeport"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Passeport()),
                  );
                },
              ),
              ListTile(
                title: Text("Prise en Charge"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Procuration"),
                onTap: () {},
              ),
              ListTile(
                title: Text("PV d'Assimilation"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.health_and_safety, color: Colors.green),
            title: Text(
              "Santé - Sociale",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            children: [
              ListTile(
                title: Text("Accident de Travail"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Allocation de Maternité"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Allocations de mariage"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Allocations Familiales"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Pension de Retraite Anticipée"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Pension de Retraite Proportionnelle"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Pensions de Retraite Normale"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Pensions de Retraite Réversion"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Pharmacie de garde"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Télédéclaration des salaires"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.school, color: Colors.purple),
            title: Text(
              "Éducation",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
            children: [
              ListTile(
                title: Text("Assiduité scolaire et absentéisme"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Épreuves du Baccalauréat"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Horaires des écoles secondaires"),
                onTap: () {},
              ),
              ListTile(
                title: Text("L'inscription au BAC"),
                onTap: () {},
              ),
              ListTile(
                title: Text("La réforme du BAC"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Obligation scolaire"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Sécurité des biens et des élèves"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.home, color: Colors.orange),
            title: Text(
              "Habitat - Logement",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            children: [
              ListTile(
                title: Text("Autorisation des Travaux de Voirie"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Certificat de Conformité Générale"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Permis de clôture"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Permis de Construire Simplifié"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Permis de Démolition"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Permis de Remblai"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.directions_car, color: Colors.teal),
            title: Text(
              "Transport",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            children: [
              ListTile(
                title: Text("Ajouter une personne sur la carte grise"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Carte grise"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Certificat de non gage"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Changement du nom du titulaire, co-titulaire"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Conduire avec un permis étranger"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Contrôle médical"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Demander un duplicata de la carte grise"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Immatriculation d'un véhicule d'occasion"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Immatriculation d'un véhicule neuf"),
                onTap: () {},
              ),
              ListTile(
                title: Text("L'accident"),
                onTap: () {},
              ),
              ListTile(
                title: Text("La destruction d'un véhicule"),
                onTap: () {},
              ),
              ListTile(
                title: Text("La transformation d'un véhicule"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Le permis de conduire"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Le retrait d'un véhicule"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Les différents permis de conduire"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Retirer une personne de la carte grise"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Vignette automobile"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.gavel, color: Colors.red),
            title: Text(
              "Justice",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            children: [
              ListTile(
                title: Text("Aide judiciaire"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Droits des enfants"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Extrait B3 du casier judiciaire"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Infractions"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Jugement curatelle"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Jugement de la responsabilité de l'enfant"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Jugement tutelle"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Notaires"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Obligations de l'Etat"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Succession (héritage)"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Terroir saveur production (T.S.P)"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Traitement spécial des mineurs"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Tribunal de statut personnel"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.attach_money, color: Colors.yellow.shade700),
            title: Text(
              "Économie et Finance",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow.shade700),
            ),
            children: [
              ListTile(
                title: Text("Base de données des entreprises"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Création d'une entreprise"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Déclaration des douanes"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Dépôt de capital social"),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                    "Enregistrement des Statuts et autres documents à l'Hôtel des Impôts"),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                    "Immatriculation à la Caisse Nationale de Sécurité Sociale (CNSS)"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Immatriculation au Registre du Commerce (RC)"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Marchés publics"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Obtention d'un certificat négatif"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Obtention de la patente"),
                onTap: () {},
              ),
              ListTile(
                title:
                    Text("Procédures administratives, fiscales et juridiques"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.public, color: Colors.brown),
            title: Text(
              "Étrangers",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            children: [
              ListTile(
                title: Text("Carte d'Identité Etrangère"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Demande d'accréditation Presse"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Demande d'autorisation de travail"),
                onTap: () {},
              ),
              ListTile(
                title: Text("e-Visa"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Renouvellement d'autorisation de travail"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.local_activity, color: Colors.indigo),
            title: Text(
              "Loisirs et Cultures",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            children: [
              ListTile(
                title: Text("Sites Touristiques"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ExpansionTile(
            leading: Icon(Icons.bolt, color: Colors.lightBlue),
            title: Text(
              "Énergie - Eau",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
            children: [
              ListTile(
                title: Text("Abonnement ONEAD"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Branchement Neuf ONEAD"),
                onTap: () {},
              ),
              ListTile(
                title:
                    Text("Demande de raccordement d'Electricité de Djibouti"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Résiliation ONEAD"),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ExpansionTile(
              leading: Icon(Icons.security, color: Colors.black87),
              title: Text(
                "Sécurité",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                ListTile(
                  title: Text("Délivrance de certificats numérique (PKI)"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EcranDeux()),
                    );
                  },
                ),
              ],
            )),
      ],
    );
  }
}
