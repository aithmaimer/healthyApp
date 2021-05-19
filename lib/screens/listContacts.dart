import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/authentification/authentification.dart';
import 'package:healthy_app/screens/addContact.dart';
import 'package:healthy_app/screens/editContact.dart';
import './Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListContactState();
  }
}

class ListContactState extends State<ListContact> {
  User user = FirebaseAuth.instance.currentUser;

  final auth = FirebaseAuth.instance;
  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Query<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('contacts')
        .where('userId', isEqualTo: user.uid);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts '),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddContact();
              }));
            },
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: users.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("No data found");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return new ListView(
                children: snapshot.data.docs.map((document) {
                  return new ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditContact(document),
                          ));
                    },
                    title: new Text(document["name"]),
                    subtitle: new Text(document["mobile"]),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
