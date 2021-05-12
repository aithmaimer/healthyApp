import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DocierMedicale extends StatefulWidget {
  @override
  _DocierMedicaleState createState() => _DocierMedicaleState();
}

class _DocierMedicaleState extends State<DocierMedicale> {
  String nom, prenom, dateNaissance, groupSanguin, adresse;
  double tele, poid, taille;
  final auth = FirebaseAuth.instance;
  DateTime pickeDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickeDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Docier medicale'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'Nom'),
                onChanged: (value) {
                  setState(() {
                    nom = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'Prenom'),
                onChanged: (value) {
                  setState(() {
                    prenom = value.trim();
                  });
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Icon(Icons.date_range_outlined),
                  title: Text("Date De Naissance"),
                  onTap: _pickdate,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'Group sanguin'),
                onChanged: (value) {
                  setState(() {
                    groupSanguin = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'Adresse'),
                onChanged: (value) {
                  setState(() {
                    prenom = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'Numero Telephone'),
                onChanged: (value) {
                  setState(() {
                    tele = value.trim() as double;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: 'Poid'),
                onChanged: (value) {
                  setState(() {
                    poid = value.trim() as double;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: 'Taille'),
                onChanged: (value) {
                  setState(() {
                    taille = value.trim() as double;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue[600],
        child: Container(
            height: 60,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.none,
                ),
              ),
            )),
      ),
    );
  }

  _pickdate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickeDate,
      firstDate: DateTime(DateTime.now().year - 90),
      lastDate: DateTime(DateTime.now().year),
    );
    if (date != null) {
      setState(() {
        pickeDate = date;
      });
    }
  }
}
