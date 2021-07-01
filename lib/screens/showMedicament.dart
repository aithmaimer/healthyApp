import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthy_app/aide/constant.dart';
import 'package:healthy_app/aide/listFormepharmacetique.dart';
import 'package:healthy_app/classes/medicament.dart';
import 'package:healthy_app/screens/HomePage.dart';
import 'package:healthy_app/screens/ListMedicament.dart';
import 'package:intl/intl.dart';

class ShowMedicament extends StatefulWidget {
  DocumentSnapshot document;
  ShowMedicament(this.document);
  @override
  State<StatefulWidget> createState() {
    return ShowMedicamentState();
  }
}

class ShowMedicamentState extends State<ShowMedicament> {
  final GlobalKey<FormState> formStateMedicament = GlobalKey<FormState>();
  String _nomMedicament,
      _formPharmacetique,
      _dateDebut,
      _dateFin,
      _momentPrise,
      _horairePrise;
  User user = FirebaseAuth.instance.currentUser;
  CollectionReference userMedicament =
      FirebaseFirestore.instance.collection('Medicament');
  DateTime _dateTimeD, _dateTimeF;
  TimeOfDay _timeOfDay;

  @override
  void initState() {
    super.initState();
    getUserData();
    _dateTimeD = DateTime.now();
    _dateTimeF = DateTime.now();
    _timeOfDay = TimeOfDay.now();
  }

  void dropChange(String val) {
    setState(() {
      _momentPrise = val;
    });
  }

  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  Future<void> insertData(final contacts) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Medicament")
        .add(contacts)
        .then((DocumentReference document) {})
        .catchError((e) {
      print(e);
    });
  }

  Future<void> deleteMedicament() async {
    print(widget.document.id);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ListMedicament()));
    return userMedicament
        .doc(widget.document.id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Medicament'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ListMedicament()));
            },
          )),
      body: Container(
        color: mSecondBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: formStateMedicament,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: widget.document['nomMedicament'],
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Nom du médicament'),
                    ),
                    TextFormField(
                      initialValue: widget.document['formPharmacetique,'],
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.capsules),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.date_range_outlined),
                        hintText: "Date Debut: ${widget.document['datDebut']}",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.4),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.date_range_outlined),
                        hintText: "Date Fin: ${widget.document['dateFin']}",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.5),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      initialValue: widget.document['momentPrise'],
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.invert_colors,
                          color: Colors.grey,
                          size: 28,
                        ),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.timelapse_outlined),
                        hintText:
                            "Horaire de prise: ${widget.document['horairePrise']}",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.4),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      onPressed: deleteMedicament,
                      child: Text('Supprimer Medicament'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
