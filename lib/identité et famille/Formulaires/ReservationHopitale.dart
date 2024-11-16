import 'package:flutter/material.dart';
import '../../Appbar.dart';


class ReservationHopitale extends StatefulWidget {
  @override
  _ReservationHopitaleState createState() => _ReservationHopitaleState();
}

class _ReservationHopitaleState extends State<ReservationHopitale> {
  String? _optionHopital;
  String? _raisonReservation;
  String? _choixReservation;
  String? _discipline;
  

 


  

 

  final List<String> disciplines = [
    // Médecine générale
    "Médecine générale - Urgences médicales",
    "Médecine générale - Médecine interne",
    // Spécialités médicales
    "Cardiologie",
    "Pneumologie",
    "Gastro-entérologie",
    "Néphrologie",
    "Endocrinologie",
    "Neurologie",
    "Oncologie",
    "Dermatologie",
    "Infectiologie",
    "Gériatrie",
    "Allergologie",
    // Spécialités chirurgicales
    "Chirurgie générale",
    "Chirurgie orthopédique",
    "Chirurgie cardiaque",
    "Chirurgie thoracique",
    "Neurochirurgie",
    "Chirurgie digestive",
    "Chirurgie pédiatrique",
    "Chirurgie plastique et reconstructrice",
    "Chirurgie maxillo-faciale",
    "Chirurgie vasculaire",
    "Ophtalmologie",
    // Spécialités gynécologiques et obstétriques
    "Gynécologie",
    "Obstétrique",
    "Médecine de la reproduction",
    // Pédiatrie
    "Pédiatrie - Médecine des enfants",
    "Pédiatrie - Néonatologie",
    // Spécialités psychiatriques et psychologiques
    "Psychiatrie générale",
    "Psychiatrie pédiatrique",
    "Addictologie",
    "Psychologie clinique",
    // Radiologie et imagerie médicale
    "Radiologie diagnostique",
    "Radiologie interventionnelle",
    // Anesthésie et réanimation
    "Anesthésie",
    "Réanimation médicale",
    // Urgences et soins intensifs
    "Médecine d’urgence",
    "Soins intensifs",
    // Autres disciplines
    "Rhumatologie",
    "ORL",
    "Urologie",
    "Médecine physique et réadaptation",
    "Médecine du sport",
    "Médecine légale",
    // Médecine de laboratoire
    "Biologie médicale",
    "Anatomopathologie",
    "Microbiologie",
    // Disciplines paramédicales et autres
    "Nutrition et diététique",
    "Kinésithérapie",
    "Orthophonie",
    "Ergothérapie",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "RESERVATION",
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
                
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: _optionHopital,
              decoration: InputDecoration(
                labelText: 'HOPITALE',
                border: OutlineInputBorder(),
              ),
              hint: Text("Sélectionnez l'hopitale"),
              items: [
                DropdownMenuItem(
                  value: "CNSS",
                  child: Text("CNSS"),
                ),
                DropdownMenuItem(
                  value: "Hopital Principal de Djibouti",
                  child: Text("Hopital Principal de Djibouti"),
                ),
                DropdownMenuItem(
                  value: "Hopital Peltier",
                  child: Text("Hopital Peltier"),
                ),
                DropdownMenuItem(
                  value: "Hopital d'Arta",
                  child: Text("Hopital d'Arta"),
                ),
                DropdownMenuItem(
                  value: "Hopital de Balbala",
                  child: Text("Hopital de Balbala"),
                ),
                DropdownMenuItem(
                  value: "Hopital de Tadjourah",
                  child: Text("Hopital de Tadjourah"),
                ),
                DropdownMenuItem(
                  value: "Hopital de Dikhil",
                  child: Text("Hopital de Dikhil"),
                ),
                DropdownMenuItem(
                  value: "Hopital de Ali-Sabieh",
                  child: Text("Hopital de Ali-Sabieh"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _optionHopital = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez sélectionner un hopital";
                }
                return null;
              },
              icon: Icon(Icons.arrow_drop_down, size: 25),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: _raisonReservation,
              decoration: InputDecoration(
                labelText: 'RAISON',
                border: OutlineInputBorder(),
              ),
              hint: Text("raison de votre reservation"),
              items: [
                DropdownMenuItem(
                  value: "Complications liées au handicap",
                  child: Text("Complications liées au handicap"),
                ),
                DropdownMenuItem(
                  value: "Accidents ou chutes",
                  child: Text("Accidents ou chutes"),
                ),
                DropdownMenuItem(
                  value: "Maladies concurrentes",
                  child: Text("Maladies concurrentes"),
                ),
                DropdownMenuItem(
                  value: "Soins de rééducation",
                  child: Text("Soins de rééducation"),
                ),
                DropdownMenuItem(
                  value: "Consultations spécialisées",
                  child: Text("Consultations spécialisées"),
                ),
                DropdownMenuItem(
                  value: "Bilan de santé ou intervention chirurgicale",
                  child: Text("Bilan de santé ou intervention chirurgicale"),
                ),
                DropdownMenuItem(
                  value: "Problèmes liés aux équipements médicaux",
                  child: Text("Problèmes liés aux équipements médicaux"),
                ),
                DropdownMenuItem(
                  value: "Crises aiguës ou douleurs sévères",
                  child: Text("Crises aiguës ou douleurs sévères"),
                ),
                DropdownMenuItem(
                  value: "Problèmes psychologiques ou psychiatriques",
                  child: Text("Problèmes psychologiques ou psychiatriques"),
                ),
                DropdownMenuItem(
                  value: "Maladies aigües",
                  child: Text("Maladies aigües"),
                ),
                DropdownMenuItem(
                  value: "Accidents",
                  child: Text("Accidents"),
                ),
                DropdownMenuItem(
                  value: "Interventions chirurgicales",
                  child: Text("Interventions chirurgicales"),
                ),
                DropdownMenuItem(
                  value: "Urgences médicales",
                  child: Text("Urgences médicales"),
                ),
                DropdownMenuItem(
                  value: "Suivi de grossesse et accouchement",
                  child: Text("Suivi de grossesse et accouchement"),
                ),
                DropdownMenuItem(
                  value: "Crises de douleurs aiguës",
                  child: Text("Crises de douleurs aiguës"),
                ),
                DropdownMenuItem(
                  value: "Problèmes cardiaques",
                  child: Text("Problèmes cardiaques"),
                ),
                DropdownMenuItem(
                  value: "Surveillance post-accident ou traitement",
                  child: Text("Surveillance post-accident ou traitement"),
                ),
                DropdownMenuItem(
                  value: "Analyses et diagnostics spécialisés",
                  child: Text("Analyses et diagnostics spécialisés"),
                ),
                DropdownMenuItem(
                  value: "Problèmes respiratoires",
                  child: Text("Problèmes respiratoires"),
                ),
                DropdownMenuItem(
                  value: "Problèmes rénaux",
                  child: Text("Problèmes rénaux"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _raisonReservation = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez sélectionner une raison";
                }
                return null;
              },
              icon: Icon(Icons.arrow_drop_down, size: 25),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              value: _choixReservation,
              decoration: InputDecoration(
                labelText: 'CHOIX',
                border: OutlineInputBorder(),
              ),
              hint: Text("Sélectionnez le choix que vous voulez"),
              items: [
                DropdownMenuItem(
                  value: "Consultation",
                  child: Text("Consultation"),
                ),
                DropdownMenuItem(
                  value: "RDV",
                  child: Text("RDV"),
                ),
              ]
              ,
              onChanged: (value) {
                setState(() {
                  _choixReservation = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez sélectionner un choix";
                }
                return null;
              },
              icon: Icon(Icons.arrow_drop_down, size: 25),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
          value: _discipline,
          decoration: InputDecoration(
            labelText: 'DISCIPLINE',
            border: OutlineInputBorder(),
          ),
          hint: Text("Sélectionner la discipline"),
          items: disciplines.map((String discipline) {
            return DropdownMenuItem<String>(
              value: discipline,
              child: Text(discipline),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _discipline = value;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Veuillez sélectionner une discipline";
            }
            return null;
          },
          icon: Icon(Icons.arrow_drop_down, size: 25),
        ),
      
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showReservationInfo(context);
              },
              child: Text("Valider"),
            ),
          ],
        ),
      ),
    );
  }

  void _showReservationInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Informations de la réservation"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Text("Hôpital: $_optionHopital"),
              Text("Raison: $_raisonReservation"),
              Text("Choix: $_choixReservation"),
              Text("Discipline: $_discipline"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
