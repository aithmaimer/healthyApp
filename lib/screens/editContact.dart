import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/classes/contact.dart';
import 'package:healthy_app/screens/home.dart';
import 'package:healthy_app/screens/listContacts.dart';

class EditContact extends StatefulWidget {
  DocumentSnapshot document;
  EditContact(this.document);
  State<StatefulWidget> createState() {
    return EditContactState();
  }
}

class EditContactState extends State<EditContact> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String specialite, mobile, name, ville, adresse;
  User user = FirebaseAuth.instance.currentUser;
  CollectionReference usercontact =
      FirebaseFirestore.instance.collection('contacts');

  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  Future<void> deleteContact() async {
    print(widget.document.id);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ListContact()));
    return usercontact
        .doc(widget.document.id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  updateData(data, docid) async {
    FirebaseFirestore.instance.collection('contacts').doc(docid).set(data);
  }

  editContact() {
    if (formState.currentState.validate()) {
      formState.currentState.save();

      final Contacts c = Contacts(
          specialite: specialite,
          mobile: mobile,
          name: name,
          ville: ville,
          adresse: adresse,
          userId: user.uid);
      updateData(c.toMap(), widget.document.id);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ListContact()));
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier Contact'),
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
                      initialValue: widget.document['name'],
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
                      initialValue: widget.document['specialite'],
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
                      initialValue: widget.document['mobile'],
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
                      initialValue: widget.document['adresse'],
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
                      initialValue: widget.document['ville'],
                    ),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      onPressed: editContact,
                      child: Text('Modifier Contact'),
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      onPressed: deleteContact,
                      child: Text('Supprimer Contact'),
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
