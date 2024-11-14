import 'package:aman_iad_app/EcranTrois.dart';
import 'package:flutter/material.dart';
import '../../Appbar.dart';
import '../../bottom_navigation_bar.dart';

class DemandeDePasseport extends StatefulWidget {
  @override
  _DemandeDePasseportState createState() => _DemandeDePasseportState();
}

class _DemandeDePasseportState extends State<DemandeDePasseport> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  final TextEditingController _pereController = TextEditingController();
  final TextEditingController _mereController = TextEditingController();
  final TextEditingController _cniController = TextEditingController();
  final TextEditingController _fcaController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _lieuController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _nationalityorigineController =
      TextEditingController();
  final TextEditingController _couleuryeuxController = TextEditingController();
  final TextEditingController _couleurcheveuxController =
      TextEditingController();
  final TextEditingController _tailleController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _domicileController = TextEditingController();

  String? _nom;
  String? _lieu;
  String? _nationality;
  String? _nationalityorigine;
  String? _couleuryeux;
  String? _couleurcheveux;
  String? _taille;
  String? _profession;
  String? _domicile;
  String? _birthday;

  String? _choixPasseport;
  String? _sexe;
  TextEditingController _dateController = TextEditingController();
  String? _Etat;
  String? _pere;
  String? _mere;
  String? _cni;
  String? _fca;
  Future<String?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text =
            "${picked.toLocal()}".split(' ')[0]; // Format YYYY-MM-DD
      });
      return _dateController.text; // Retourne la valeur saisie
    }

    return null; // Retourne null si aucune date n'est sélectionnée
  }

  // Méthode pour afficher une boîte de dialogue avec les informations saisies
  void _showFormDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informations Saisies '),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Choix de passeport: $_choixPasseport'),
                Text('nom : $_nom'),
                Text('Né(e) le : $_birthday'),
                Text(' à  : $_lieu'),
                Text('Fils/fille de : $_pere'),
                Text('Et de : $_mere'),
                Text('de sexe : $_sexe'),
                Text('État civil : $_Etat'),
                Text('Numero de la carte (CNI): $_cni'),
                Text('Délivré le : ${_dateController.text}'),
                Text('Avec numero du dossier : $_fca'),
                Text('de nationalité : $_nationality'),
                Text('et d\'origine : $_nationalityorigine'),
                Text('avec les couleurs des yeux  : $_couleuryeux'),
                Text('et les cheveux : $_couleurcheveux'),
                Text('avec une taille de  : $_taille m'),
                Text('profession : $_profession'),
                Text('habite à  : $_domicile'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EcranTrois()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Demande de Passeport",
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Theme(
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep == 0) {
                // Validation pour l'étape "Choix"
                if ((_choixPasseport == null) || (_birthday == null)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Veuillez sélectionner un type de passeport avant de continuer.")),
                  );
                } else {
                  setState(() {
                    _currentStep++;
                  });
                }
              } else if (_currentStep == 1) {
                // if ((_pereController == null) ||
                //    (_mereController == null) ||
                ////    (_cniController == null) ||
                //   (_fcaController == null) ||
                //   (_sexe == null) ||
                //   (_Etat == null)) {
                //  ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //       content:
                //          Text("Veuillez remplir tous les champs requis.")),
                //  );
                //  } else {
                setState(() {
                  _currentStep++;
                });
                // }
              } else if (_currentStep == 2) {
                if (_formKey.currentState!.validate()) {
                  _pere = _pereController.text;
                  _mere = _mereController.text;
                  _cni = _cniController.text;
                  _fca = _fcaController.text;
                  _nom = _nomController.text;
                  _lieu = _lieuController.text;
                  _nationality = _nationalityController.text;
                  _nationalityorigine = _nationalityorigineController.text;
                  _couleurcheveux = _couleurcheveuxController.text;
                  _couleuryeux = _couleuryeuxController.text;
                  _taille = _tailleController.text;
                  _profession = _professionController.text;
                  _domicile = _domicileController.text;

                  _showFormDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text("Veuillez remplir tous les champs requis.")),
                  );
                }
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            steps: [
              Step(
                title: Text("1"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date de naissance',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                        hintText: "Entrez votre date de naissance",
                      ),
                      readOnly: true,
                      onTap: () async {
                        String? birthday = await _selectDate(context);
                        if (birthday != null) {
                          setState(() {
                            _birthday = birthday;
                          });
                        }
                      },
                      validator: (_birthday) {
                        if (_birthday == null || _birthday.isEmpty) {
                          return "Veuillez entrer votre date de naissance";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Text("Je sollicite: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    RadioListTile(
                      title: Text("Un Nouveau Passeport"),
                      value: " Un Nouveau Passeport",
                      groupValue: _choixPasseport,
                      onChanged: (value) {
                        setState(() {
                          _choixPasseport = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(" Un Renouvellement du Passeport"),
                      value: " Un Renouvellement",
                      groupValue: _choixPasseport,
                      onChanged: (value) {
                        setState(() {
                          _choixPasseport = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Un Passeport Spécial pour le Pèlerinage"),
                      value: " Un Passeport Spécial",
                      groupValue: _choixPasseport,
                      onChanged: (value) {
                        setState(() {
                          _choixPasseport = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep == 0 ? StepState.editing : StepState.complete,
              ),
              Step(
                title: Text("2"),
                content: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _tailleController,
                        decoration: InputDecoration(
                          labelText: 'taille',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _couleuryeuxController,
                        decoration: InputDecoration(
                          labelText: 'couleur yeux',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _couleurcheveuxController,
                        decoration: InputDecoration(
                          labelText: 'couleur cheveux',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _nomController,
                        decoration: InputDecoration(
                          labelText: 'nom',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _professionController,
                        decoration: InputDecoration(
                          labelText: 'profession',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _nationalityController,
                        decoration: InputDecoration(
                          labelText: 'nationalité',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _nationalityorigineController,
                        decoration: InputDecoration(
                          labelText: 'origine',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _domicileController,
                        decoration: InputDecoration(
                          labelText: 'domicile',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _lieuController,
                        decoration: InputDecoration(
                          labelText: 'lieu',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _pereController,
                        decoration: InputDecoration(
                          labelText: 'Fils/Fille de(nom du père)',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre père",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom du pere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _mereController,
                        decoration: InputDecoration(
                          labelText: 'Et de(nom de la mère)',
                          border: OutlineInputBorder(),
                          hintText: "Entrer le nom de votre mère",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le nom de la mere";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _cniController,
                        decoration: InputDecoration(
                          labelText: 'N° CNI',
                          border: OutlineInputBorder(),
                          hintText: "Entrez votre numéro de carte d'identité",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le numero CNI de votre carte";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 0),
                      TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Délivrée le',
                          suffixIcon: Icon(Icons.calendar_today),
                          hintText:
                              "Entrez la date de delivrance de votre carte d'identité",
                        ),
                        readOnly: true,
                        onTap: () async {
                          String? selectedDate = await _selectDate(context);
                          if (selectedDate != null) {
                            setState(() {
                              _dateController.text = selectedDate;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _fcaController,
                        decoration: InputDecoration(
                          labelText: 'N° dossiers FCA',
                          border: OutlineInputBorder(),
                          hintText: "Entrez votre numéro du dossier FCA",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer le numéro du dossier FCA";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      Text("Sexe:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      RadioListTile(
                        title: Text("Masculin"),
                        value: "Masculin",
                        groupValue: _sexe,
                        onChanged: (value) {
                          setState(() {
                            _sexe = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Féminin"),
                        value: "Féminin",
                        groupValue: _sexe,
                        onChanged: (value) {
                          setState(() {
                            _sexe = value.toString();
                          });
                        },
                      ),
                      Text("Etat Civil:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      RadioListTile(
                        title: Text("Célibataire"),
                        value: "Célibataire",
                        groupValue: _Etat,
                        onChanged: (value) {
                          setState(() {
                            _Etat = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Marié(e)"),
                        value: "Marié(e)",
                        groupValue: _Etat,
                        onChanged: (value) {
                          setState(() {
                            _Etat = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Veuf(ve)"),
                        value: "Veuf(ve)",
                        groupValue: _Etat,
                        onChanged: (value) {
                          setState(() {
                            _Etat = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Divorcé(e)"),
                        value: "Divorcé(e)",
                        groupValue: _Etat,
                        onChanged: (value) {
                          setState(() {
                            _Etat = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Séparé(e)"),
                        value: "Séparé(e)",
                        groupValue: _Etat,
                        onChanged: (value) {
                          setState(() {
                            _Etat = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep == 1 ? StepState.editing : StepState.complete,
              ),
              Step(
                title: Text("3"),
                content: Column(
                  children: [
                    SizedBox(height: 20),
                  ],
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep == 2 ? StepState.editing : StepState.complete,
              ),
            ],
          ),
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              //background: Colors.grey[200],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
