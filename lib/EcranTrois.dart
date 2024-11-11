import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EcranDeux.dart';
import 'dart:math';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class EcranTrois extends StatefulWidget {
  @override
  State<EcranTrois> createState() => _EcranTroisState();
}

class _EcranTroisState extends State<EcranTrois> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _verifySession();
  }

  Future<void> _verifySession() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EcranDeux()),
      );
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EcranDeux()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double buttonDistance =
        80; // Distance entre le FAB et les boutons supplémentaires
    double angle = pi / 4; // Angle entre chaque bouton (45 degrés ici)
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Accueil",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue.shade300),
                child: Text(
                  'Options',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Déconnexion'),
                onTap: () => _logout(),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Profil'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.grey),
                title: Text('Paramètres'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.support_agent, color: Colors.green),
                title: Text('Support'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.lightBlue),
                title: Text('À propos'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.feedback, color: Colors.orange),
                title: Text('Feedback'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.purple),
                title: Text('Aide'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text("Autorisation de l'Accompagnement"),
                          onTap: () {},
                        ),
                        ListTile(
                          title:
                              Text("Autorisation parentale d'un enfant mineur"),
                          onTap: () {},
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
                          title: Text(
                              "Obtention Numéro National d'Identification"),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text("Passeport"),
                          onTap: () {},
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
                    ),
                    child: ExpansionTile(
                      leading:
                          Icon(Icons.health_and_safety, color: Colors.green),
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                          title:
                              Text("Ajouter une personne sur la carte grise"),
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
                          title: Text(
                              "Changement du nom du titulaire, co-titulaire"),
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
                          title:
                              Text("Demander un duplicata de la carte grise"),
                          onTap: () {},
                        ),
                        ListTile(
                          title:
                              Text("Immatriculation d'un véhicule d'occasion"),
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
                    ),
                    child: ExpansionTile(
                      leading: Icon(Icons.gavel, color: Colors.red),
                      title: Text(
                        "Justice",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
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
                          title:
                              Text("Jugement de la responsabilité de l'enfant"),
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
                    ),
                    child: ExpansionTile(
                      leading: Icon(Icons.attach_money,
                          color: Colors.yellow.shade700),
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
                          title: Text(
                              "Immatriculation au Registre du Commerce (RC)"),
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
                          title: Text(
                              "Procédures administratives, fiscales et juridiques"),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                          title:
                              Text("Renouvellement d'autorisation de travail"),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                      color: Colors.grey.shade200, // Couleur de fond souhaitée
                      borderRadius:
                          BorderRadius.circular(8), // Ajoute des coins arrondis
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
                          title: Text(
                              "Demande de raccordement d'Electricité de Djibouti"),
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
                        color:
                            Colors.grey.shade200, // Couleur de fond souhaitée
                        borderRadius: BorderRadius.circular(
                            8), // Ajoute des coins arrondis
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
                            title: Text(
                                "Délivrance de certificats numérique (PKI)"),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Qu'est-ce que la sécurité?"),
                                    content: Text(
                                      "La sécurité concerne la protection des informations, "
                                      "des ressources et des personnes contre les risques et les menaces. "
                                      "Elle comprend des mesures pour assurer la confidentialité, "
                                      "l'intégrité et la disponibilité des données.",
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text("Annuler"),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Ferme la boîte de dialogue
                                        },
                                      ),
                                      TextButton(
                                        child: Text("En savoir plus"),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Ferme la boîte de dialogue
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EcranDeux()),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),

          // Le FloatingActionButton principal
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              backgroundColor: Colors.blue,
              shape: CircleBorder(),
              elevation: 10.0,
              child: Icon(Icons.add),
            ),
          ),

          if (_isExpanded) ...[
            _buildArcButton(0, buttonDistance, angle, Icons.home, Colors.grey),
            _buildArcButton(
                1, buttonDistance, angle, Icons.search, Colors.grey),
            _buildArcButton(
                2, buttonDistance, angle, Icons.notifications, Colors.grey),
          ],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.white),
            label: 'S\'inscrire',
          ),
        ],
        currentIndex: 1,
        onTap: (int item) {},
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        iconSize: 30.0,
      ),
    );
  }

  // Fonction pour construire chaque bouton autour du FAB
  Positioned _buildArcButton(
      int index, double distance, double angle, IconData icon, Color color) {
    double xPosition = distance * cos(angle * index);
    double yPosition = distance * sin(angle * index);

    return Positioned(
      bottom: 30 + yPosition,
      right: 30 + xPosition,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: color,
        child: Icon(icon),
      ),
    );
  }
}
