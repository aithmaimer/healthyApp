import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/classes/docierMedi.dart';
import 'package:intl/intl.dart';

import '../pallete.dart';

class AddDocierMedicale extends StatefulWidget {
  @override
  _AddDocierMedicaleState createState() => _AddDocierMedicaleState();
}

class _AddDocierMedicaleState extends State<AddDocierMedicale> {
  String _username, _email, _groupSanguin, _poid, _taille, _dateNaissance;
  final GlobalKey<FormState> formStat = GlobalKey<FormState>();
  User user = FirebaseAuth.instance.currentUser;

  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  updateData(data, docid) async {
    FirebaseFirestore.instance
        .collection('docierMedicale')
        .doc(docid)
        .set(data);
  }

  editDocierMedicale() {
    if (formStat.currentState.validate()) {
      formStat.currentState.save();

      final DocierMedi c = DocierMedi(
          username: _username,
          email: _email,
          poid: _poid,
          taille: _taille,
          dateN: _dateNaissance,
          groupSanguin: _groupSanguin,
          userId: user.uid);
      updateData(c.toMap(), user.uid);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  DateTime _dateTime;

  void dropChange(String val) {
    setState(() {
      _groupSanguin = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Docier medicale'),
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('docierMedicale')
                  .where('userId', isEqualTo: user.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children: snapshot.data.docs.map((document) {
                    return Column(
                      children: [
                        Form(
                          key: formStat,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: document['username'],
                                  validator: (val) {
                                    if (val.length > 100)
                                      return "User can't to be larger then 100 letters ";
                                    else if (val.length < 2)
                                      return "User can't to be lesse then 2 letters ";
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _username = val;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Icon(
                                        Icons.person,
                                        size: 28,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    hintText: "username",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      height: 1.5),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: document['email'],
                                  readOnly: true,
                                  onSaved: (val) {
                                    _email = val;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Icon(
                                        Icons.email_outlined,
                                        size: 28,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    hintText: "Emaile",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      height: 1.5),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Date Naissance: ${document['date_naissance']}",
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          height: 1.5),
                                      prefixIcon: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.blue,
                                        size: 28,
                                      )),
                                  onTap: () async {
                                    DateTime date = await showDatePicker(
                                        context: context,
                                        initialDate: _dateTime,
                                        firstDate: DateTime(1930),
                                        lastDate: DateTime(2022));
                                    if (date != null)
                                      setState(() {
                                        _dateTime = date;
                                        _dateNaissance =
                                            DateFormat('yyyy-MM-dd')
                                                .format(date);
                                      });
                                    print(
                                        "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}");
                                    print(_dateNaissance);
                                  },
                                  //style: kBodyText,
                                ),
                              ),
                              /* Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.invert_colors,
                                          color: Colors.blue,
                                          size: 28,
                                        ),
                                      ),
                                      hint: Text("Groupe sanguin"),
                                      onChanged: dropChange,
                                      value: document['group_sanguin'],
                                      items: <String>[
                                        "A+",
                                        "A-",
                                        "B+",
                                        "B-",
                                        "AB+",
                                        "AB-",
                                        "O+",
                                        "O-"
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value,
                                        );
                                      }).toList())),
                                      */
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: document['group_sanguin'],
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Icon(
                                        Icons.invert_colors,
                                        size: 28,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      height: 1.5),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: document['poid'],
                                  onSaved: (val) {
                                    _poid = val;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Icon(
                                        Icons.line_weight,
                                        size: 28,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    hintText: "Poid (kg)",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  style: kBodyText,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: document['taille'],
                                  onSaved: (val) {
                                    _taille = val;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Icon(
                                        Icons.line_weight,
                                        size: 28,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    hintText: "taille",
                                    hintStyle: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      height: 1.5),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: size.height * 0.08,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: kBlue,
                                ),
                                child: FlatButton(
                                  onPressed: () async {
                                    // editDocierMedicale();
                                    print(user.uid);
                                  },
                                  child: Text(
                                    "Enregistrer",
                                    style: kBodyText.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              })),
    );
  }
}
