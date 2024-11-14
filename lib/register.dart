import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'background.dart';
import 'database_helper.dart';
import 'EcranDeux.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  late AnimationController controller;
  late Animation<double> animation;

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
    super.dispose();
  }

  // Fonction pour hacher le mot de passe
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes);
    return hashedPassword.toString();
  }

  Future<void> _registerUser() async {
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String pass = _password2Controller.text;

    if (password != pass) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("MOT DE PASSE NON IDENTIQUE!")),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      try {
        final dbHelper = DatabaseHelper.instance;

        // Vérifiez si l'email existe déjà dans la base de données
        final emailExists = await dbHelper.emailExists(email);
        if (emailExists) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Adresse email déjà existante !")),
          );
          return;
        }

        // Hacher le mot de passe
        final hashedPassword = _hashPassword(password);

        // Si l'email n'existe pas, enregistrez l'utilisateur dans la base de données
        final db = await dbHelper.database;
        await db.insert(
          'users',
          {
            'username': username,
            'email': email,
            'password': hashedPassword,
          },
        );

        // Afficher un message de succès
        if (mounted) {
          _usernameController.clear();
          _emailController.clear();
          _passwordController.clear();
          _password2Controller.clear();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(
                  content: Text("Inscription réussie !"),
                  duration: Duration(seconds: 5)))
              .closed
              .then((_) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EcranDeux()),
            );
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Erreur lors de l'inscription : $e")),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 7),
        child: Column(
          children: [
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
                    Icon(Icons.person_add, color: Colors.white),
                    SizedBox(width: 20),
                    Text(
                      "INSCRIPTION",
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
          colorsbackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.shade300,
                        blurRadius: 8,
                        offset: Offset(0, -4),
                      ),
                      BoxShadow(
                        color: Colors.green.shade200,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.person_add,
                          size: 100.0,
                          color: Colors.grey,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: "Nom d'utilisateur",
                            prefixIcon:
                                Icon(Icons.person, color: Colors.blueGrey),
                            hintText: "Entrez votre nom",
                            labelStyle: TextStyle(color: Colors.blueGrey),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Veuillez entrer un nom d'utilisateur";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon:
                                Icon(Icons.mail, color: Colors.blueGrey),
                            hintText: "Entrez votre adresse mail",
                            labelStyle: TextStyle(color: Colors.blueGrey),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Veuillez entrer un email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Mot de passe",
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.blueGrey),
                            hintText: "Entrez un mot de passe",
                            labelStyle: TextStyle(color: Colors.blueGrey),
                          ),
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Veuillez entrer un mot de passe";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _password2Controller,
                          decoration: InputDecoration(
                            labelText: "Confirmation",
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.blueGrey),
                            hintText: "Confirmez le mot de passe",
                            labelStyle: TextStyle(color: Colors.blueGrey),
                          ),
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Veuillez confirmer le mot de passe";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EcranDeux()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade200,
                                onPrimary: Colors.white,
                              ),
                              child: Text("CONNEXION"),
                            ),
                            ElevatedButton(
                              onPressed: _registerUser,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                onPrimary: Colors.white,
                              ),
                              child: Text('S\'INSCRIRE'),
                            ),
                          ],
                        ),
                        Center(
                          child: Text("ou continuer avec "),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EcranDeux()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green.shade400,
                            onPrimary: Colors.white,
                          ),
                          child: Text("MOBILE ID"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add, color: Colors.white),
            label: 'S\'inscrire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.white),
            label: 'Login',
          ),
        ],
        currentIndex: 1,
        onTap: (int item) {
          if (item == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EcranDeux()),
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
