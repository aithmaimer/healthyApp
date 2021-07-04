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

class MedicamentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MedicamentPageState();
  }
}

class MedicamentPageState extends State<MedicamentPage> {
  final GlobalKey<FormState> formStateMedicament = GlobalKey<FormState>();
  String _nomMedicament,
      _formPharmacetique,
      _dateDebut,
      _dateFin,
      _momentPrise,
      _horairePrise;
  User user = FirebaseAuth.instance.currentUser;
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

  Future<void> insertData(final medicaments) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Medicament")
        .add(medicaments)
        .then((DocumentReference document) {})
        .catchError((e) {
      print(e);
    });
  }

  addMedicamentPage() {
    if (formStateMedicament.currentState.validate()) {
      formStateMedicament.currentState.save();

      final Medicament m = Medicament(
          nomMedicament: _nomMedicament,
          formPharmacetique: _formPharmacetique,
          datDebut: _dateDebut,
          dateFin: _dateFin,
          momentPrise: _momentPrise,
          horairePrise: _horairePrise,
          userId: user.uid);
      insertData(m.toMap());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ListMedicament()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String selecttedPhar = ModalRoute.of(context).settings.arguments;
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
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Nom du médicament'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Enter Nome de mécament';
                        }
                      },
                      onSaved: (val) => _nomMedicament = val,
                    ),
                    TextFormField(
                      initialValue: selecttedPhar,
                      onSaved: (newValue) {
                        _formPharmacetique = selecttedPhar;
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.capsules),
                        suffixIcon: Icon(Icons.navigate_next),
                        hintText: "Forme farmacetique ",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.grey, height: 1.5),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListPharmacetique()));
                      },
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.date_range_outlined),
                        hintText:
                            "Date Debut: ${_dateTimeD.day}/${_dateTimeD.month}/${_dateTimeD.year}",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.4),
                      ),
                      onTap: () async {
                        DateTime date = await showDatePicker(
                            context: context,
                            initialDate: _dateTimeD,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2022));
                        if (date != null)
                          setState(() {
                            _dateTimeD = date;
                            _dateDebut = DateFormat('yyyy-MM-dd').format(date);
                          });
                        print(
                            "${_dateTimeD.day}/${_dateTimeD.month}/${_dateTimeD.year}");
                        print(_dateDebut);
                      },
                      //style: kBodyText,
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.date_range_outlined),
                        hintText:
                            "Date Fin: ${_dateTimeF.day}/${_dateTimeF.month}/${_dateTimeF.year}",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.5),
                      ),
                      onTap: () async {
                        DateTime date = await showDatePicker(
                            context: context,
                            initialDate: _dateTimeF,
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2025));
                        if (date != null)
                          setState(() {
                            _dateTimeF = date;
                            _dateFin = DateFormat('yyyy-MM-dd').format(date);
                          });
                      },
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.invert_colors,
                            color: Colors.grey,
                            size: 28,
                          ),
                          hintText: "Moment de prise",
                          hintStyle: TextStyle(
                              fontSize: 22, color: Colors.grey, height: 1.5),
                        ),
                        onChanged: dropChange,
                        //value: _momentPrise,
                        items: <String>[
                          "sans importance",
                          "En dehors des repas",
                          "Avant les repas",
                          "Pendant les repas",
                          "Aprés les repas",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    height: 1.5)),
                            value: value,
                          );
                        }).toList()),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.timelapse_outlined),
                        hintText:
                            "Horaire de prise: ${_timeOfDay.hour} : ${_timeOfDay.minute}",
                        hintStyle: TextStyle(
                            fontSize: 20, color: Colors.black, height: 1.4),
                      ),
                      onTap: () async {
                        TimeOfDay date = await showTimePicker(
                          context: context,
                          initialTime: _timeOfDay,
                        );
                        if (date != null)
                          setState(() {
                            _timeOfDay = date;
                            _horairePrise = TimeOfDay(
                                    hour: _timeOfDay.hour,
                                    minute: _timeOfDay.minute)
                                .format(context);
                          });
                      },
                      //style: kBodyText,
                    ),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      onPressed: addMedicamentPage,
                      child: Text('Add New Medicament'),
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
