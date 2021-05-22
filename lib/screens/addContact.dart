import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/classes/contact.dart';
import 'package:healthy_app/screens/listContacts.dart';

class AddContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddContactState();
  }
}

class AddContactState extends State<AddContact> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String specialite, mobile, name, ville, adresse;
  User user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  Future<void> insertData(final Contacts) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("contacts")
        .add(Contacts)
        .then((DocumentReference document) {})
        .catchError((e) {
      print(e);
    });
  }

  addContact() {
    if (formState.currentState.validate()) {
      formState.currentState.save();

      final Contacts c = Contacts(
          specialite: specialite,
          mobile: mobile,
          name: name,
          ville: ville,
          adresse: adresse,
          userId: user.uid);
      insertData(c.toMap());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ListContact()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Contact'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: formState,
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.person), hintText: 'Name'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Enter Name Of Contact';
                        }
                      },
                      onSaved: (val) => name = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.email), hintText: 'specialite'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter specialite Of Contact';
                        }
                      },
                      onSaved: (val) => specialite = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone), hintText: 'Mobile'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Enter Mobile Of Contact';
                        } else if (val.length < 10) {
                          return 'your Mobile need to be atleast 10 Number';
                        }
                      },
                      onSaved: (val) => mobile = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.email), hintText: 'Address'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Adresse Of Contact';
                        }
                      },
                      onSaved: (val) => adresse = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.email), hintText: 'ville'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter ville Of Contact';
                        }
                      },
                      onSaved: (val) => ville = val,
                    ),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      onPressed: addContact,
                      child: Text('Add New Contact'),
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
