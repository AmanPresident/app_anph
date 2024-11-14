import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EcranDeux.dart';
import 'dart:math';
import 'bodyAcueil.dart';
import 'Recherche.dart';
import '../bottom_navigation_bar.dart';

class EcranTrois extends StatefulWidget {
  @override
  State<EcranTrois> createState() => _EcranTroisState();
}

class _EcranTroisState extends State<EcranTrois> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final BodyAccueile bodyAccueile = BodyAccueile();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchActive = false;

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
    double buttonDistance = 80;
    double angle = pi / 4;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 1, 48, 87),
                Color.fromARGB(255, 81, 175, 230),
                Color.fromARGB(255, 1, 48, 87),
              ],
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 4,
            centerTitle: false,
            title: _isSearchActive
                ? TextField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Recherche...',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 219, 133, 4)),
                      border: InputBorder.none,
                      icon: Icon(Icons.search,
                          color: Color.fromARGB(255, 219, 133, 4)),
                    ),
                  )
                : Row(
                    children: [
                      Icon(Icons.home, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Accueil",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
            actions: [
              IconButton(
                  icon: Icon(
                    _isSearchActive ? Icons.close : Icons.search,
                    color: Color.fromARGB(255, 219, 133, 4),
                  ),
                  onPressed: () {}),
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState
                      ?.openEndDrawer(); // Ouvre le menu latéral
                },
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 15, 54, 87)),
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
          Container(
            height: 7.0,
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: BodyAccueil(),
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
      bottomNavigationBar: AppBottomNavigationBar(),
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
