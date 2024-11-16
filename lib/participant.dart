import 'package:flutter/material.dart';

class TeamForm extends StatefulWidget {
  @override
  _TeamFormState createState() => _TeamFormState();
}

class _TeamFormState extends State<TeamForm> {
  final _teamNameController = TextEditingController();
  List<Map<String, TextEditingController>> _participants = [];

  @override
  void initState() {
    super.initState();
    _addParticipant(); // Ajoute un premier champ de participant par défaut
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    for (var participant in _participants) {
      participant.values.forEach((controller) => controller.dispose());
    }
    super.dispose();
  }

  void _addParticipant() {
    setState(() {
      _participants.add({
        'name': TextEditingController(),
        'id': TextEditingController(),
        'birthDate': TextEditingController(),
        'email': TextEditingController(),
        'phone': TextEditingController(),
      });
    });
  }

  void _removeParticipant(int index) {
    setState(() {
      _participants.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Présentation de l'équipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Nom de l'équipe *",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _teamNameController,
              decoration: InputDecoration(
                hintText: "Nom de l'équipe",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Membre(s) du groupe",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            for (int i = 0; i < _participants.length; i++) _buildParticipantForm(i),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Ajouter un participant"),
              onPressed: _addParticipant,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Action de retour
                  },
                  child: Text("Retour"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action de soumission
                  },
                  child: Text("Suivant"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParticipantForm(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index > 0)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.red),
                onPressed: () => _removeParticipant(index),
              ),
            ),
          Text("Nom du participant *"),
          TextFormField(
            controller: _participants[index]['name'],
            decoration: InputDecoration(
              hintText: "Nom du participant",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text("Numéro de la carte d'identité ou d'étudiant *"),
          TextFormField(
            controller: _participants[index]['id'],
            decoration: InputDecoration(
              hintText: "Numéro de carte",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text("Date de naissance *"),
          TextFormField(
            controller: _participants[index]['birthDate'],
            decoration: InputDecoration(
              hintText: "Date de naissance",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.calendar_today),
            ),
          ),
          SizedBox(height: 10),
          Text("Email du participant *"),
          TextFormField(
            controller: _participants[index]['email'],
            decoration: InputDecoration(
              hintText: "Email du participant",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text("Téléphone du participant *"),
          TextFormField(
            controller: _participants[index]['phone'],
            decoration: InputDecoration(
              hintText: "Téléphone du participant",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
