import 'package:flutter/material.dart';
import 'identité et famille/AttestationAccueil.dart'; // Assurez-vous que le chemin est correct

class BodyAccueile extends StatefulWidget {
  @override
  _BodyAccueileState createState() => _BodyAccueileState();
}

class _BodyAccueileState extends State<BodyAccueile> {
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

  List<Map<String, dynamic>> allItems = [
    {'title': 'Attestation d\'Accueil', 'screen': AttestationAccueil()},
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
      print("Aucun élément trouvé");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // Ajoutez votre code de construction de widget ici
        );
  }
}
