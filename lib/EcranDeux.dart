import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart'; 
import 'database_helper.dart'; 
import 'EcranTrois.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class EcranDeux extends StatefulWidget {
  @override
  State<EcranDeux> createState() => _EcranDeuxState();
}

class _EcranDeuxState extends State<EcranDeux>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 0.9).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Méthode de connexion
  Future<void> _login() async {
    final String login = _loginController.text;
    final String password = _passwordController.text;

    // Hachez le mot de passe saisi par l'utilisateur
    final String hashedPassword = hashPassword(password);

    // Vérifiez si le login et le mot de passe haché correspondent dans la base de données
    final bool isLoggedIn = await dbHelper.loginUser(login, hashedPassword);

    if (isLoggedIn) {
      // Stocker la session de l'utilisateur
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      // Effacer les champs de saisie
      _loginController.clear();
      _passwordController.clear();

      // Connexion réussie, navigation vers l'écran d'accueil
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EcranTrois()),
      );
    } else {
      // Affiche une notification si les informations sont incorrectes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Nom ou mot de passe incorrect")),
      );
    }
  }

  // Fonction pour hacher le mot de passe
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes).toString();
    return hashedPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 7),
        child: Column( children: [
          
          Container(
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
            title: Row(
              children: [
                Icon(Icons.account_circle, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  "CONNEXION",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ),
          Container(
              height: 7.0,
              color: Colors.green,
          ),
          
        ],
        
        ),
          
        ),
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  
                  SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red.shade300,
                            blurRadius: 8,
                            offset: Offset(0, -4)),
                        BoxShadow(
                            color: Colors.green.shade200,
                            blurRadius: 8,
                            offset: Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.account_circle , size: 200.0, color: Colors.grey,),
                        SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(0.0, -0.9), end: Offset.zero)
                              .animate(controller),
                          child: TextField(
                            controller: _loginController,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.blueGrey),
                              labelText: 'Login',
                              hintText: "Entrez votre login ou adresse mail",
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.blueGrey),
                            ),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 30),
                        SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(0.0, -0.9), end: Offset.zero)
                              .animate(controller),
                          child: TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.blueGrey),
                              labelText: 'Mot de passe',
                              hintText: "Entrez votre mot de passe",
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.blueGrey),
                            ),
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .blue.shade200, 
                                onPrimary:
                                    Colors.white, 
                              ),
                              child: Text("REGISTRATION"),
                            ),
                            ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                primary: Colors
                                    .blueAccent, 
                                onPrimary:
                                    Colors.white, 
                              ),
                              child: Text("CONNEXION"),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text("ou continuer avec "),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EcranDeux()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .green.shade400, 
                            onPrimary:
                                Colors.white, 
                          ),
                          child: Text("MOBILE ID"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.white),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add, color: Colors.white),
            label: 'S\'inscrire',
          ),
        ],
        currentIndex: 1,
        onTap: (int item) {
          if (item == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegistrationScreen(),
              ),
            );
          }
        },
        backgroundColor: Color.fromARGB(255, 5, 65, 114),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
