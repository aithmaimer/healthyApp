import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/classes/docierMedi.dart';
import 'package:image_picker/image_picker.dart';

class AddDocierMedicale extends StatefulWidget {
  @override
  _AddDocierMedicaleState createState() => _AddDocierMedicaleState();
}

class _AddDocierMedicaleState extends State<AddDocierMedicale> {
  String _nom,
      _prenom,
      _groupSanguin,
      _adresse,
      _mobile,
      _poid,
      _taille,
      _dateNaissance;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  User user = FirebaseAuth.instance.currentUser;

  File _file;
  Future pickercamera() async {
    final myfile = await ImagePicker().getImage(source: ImageSource.camera);
  }

  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  Future<void> insertData(final DocierMedi) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("docierMedicale")
        .add(DocierMedi)
        .then((DocumentReference document) {})
        .catchError((e) {
      print(e);
    });
  }

  DateTime _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateTime = DateTime.now();
    getUserData();
  }

  void dropChange(String val) {
    setState(() {
      _groupSanguin = val;
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
            Form(
              key: formState,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      /* validator: (val) {
                        if (val.length > 100)
                          return "User can't to be larger then 100 letters ";
                        else if (val.length < 2)
                          return "User can't to be lesse then 2 letters ";
                        return null;
                      },*/
                      onSaved: (val) {
                        _nom = val;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                        hintText: "nom",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: TextStyle(
                          fontSize: 22, color: Colors.black, height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      /*  validator: (val) {
                        if (val.length > 100)
                          return "User can't to be larger then 100 letters ";
                        else if (val.length < 2)
                          return "User can't to be lesse then 2 letters ";
                        return null;
                      },*/
                      onSaved: (val) {
                        _prenom = val;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                        hintText: "prenom",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: TextStyle(
                          fontSize: 22, color: Colors.black, height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                              _dateNaissance = date.toUtc().toString();
                            });
                          print(
                              "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}");
                          print(_dateNaissance);
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                          hint: Text("Groupe sanguin"),
                          onChanged: dropChange,
                          value: _groupSanguin,
                          items: <String>["A+", "A-", "O+"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            );
                          }).toList())),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      /*   validator: (val) {
                        if (val.length > 100)
                          return "User can't to be larger then 100 letters ";
                        else if (val.length < 2)
                          return "User can't to be lesse then 2 letters ";
                        return null;
                      },*/
                      onSaved: (val) {
                        _adresse = val;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                        hintText: "adress",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: TextStyle(
                          fontSize: 22, color: Colors.black, height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      /* validator: (val) {
                        if (val.length > 15)
                          return "Mobile can't to be larger then 15 nbrs ";
                        else if (val.length < 10)
                          return "Mobile can't to be lesse then 10 nbre ";
                        return null;
                      },
                      */
                      onSaved: (val) {
                        _mobile = val;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                        hintText: "mobile",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: TextStyle(
                          fontSize: 22, color: Colors.black, height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      /* validator: (val) {
                        if (val.length > 100)
                          return "User can't to be larger then 100 letters ";
                        else if (val.length < 2)
                          return "User can't to be lesse then 2 letters ";
                        return null;
                      },
                      */
                      onSaved: (val) {
                        _poid = val;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                        hintText: "poid en ( kg )",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: TextStyle(
                          fontSize: 22, color: Colors.black, height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      /* validator: (val) {
                          if (val.length > 100)
                            return "User can't to be larger then 100 letters ";
                          else if (val.length < 2)
                            return "User can't to be lesse then 2 letters ";
                          return null;
                        },*/
                      onSaved: (val) {
                        _taille = val;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.blueAccent,
                          ),
                        ),
                        hintText: "taille",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      style: TextStyle(
                          fontSize: 22, color: Colors.black, height: 1.5),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddDocierMedicale(),
                              ));
                        },
                        title: Text("ajouter un photo ou bien un fichier"),
                        trailing: IconButton(
                          icon: Icon(Icons.camera_alt),
                          color: Colors.lightBlueAccent,
                          onPressed: () {},
                        ),
                      )),
                ],
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
              onPressed: () {
                if (formState.currentState.validate()) {
                  formState.currentState.save();

                  final DocierMedi c = DocierMedi(
                      nom: _nom,
                      prenom: _prenom,
                      mobile: _mobile,
                      poid: _poid,
                      taille: _taille,
                      adresse: _adresse,
                      dateN: _dateNaissance,
                      groupSanguin: _groupSanguin,
                      userId: user.uid);
                  insertData(c.toMap());
                  print("=============");
                  print(_dateNaissance);
                  // Navigator.pushReplacement(
                  //   context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
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
