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
  DateTime _dateTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateTime = DateTime.now();
  }

  String dropval;
  void dropChange(String val) {
    setState(() {
      dropval = val;
    });
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
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText:
                          "Date Naissace: ${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                      suffixIcon: Icon(Icons.date_range_outlined)),
                  onTap: () async {
                    DateTime date = await showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: DateTime(1930),
                        lastDate: DateTime(2022));
                    if (date != null)
                      setState(() {
                        _dateTime = date;
                      });
                    print(
                        "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}");
                  },
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    hint: Text("Groupe sanguin"),
                    onChanged: dropChange,
                    value: dropval,
                    items: <String>["A+", "A-", "O+"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList())),
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
                keyboardType: TextInputType.phone,
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
}
