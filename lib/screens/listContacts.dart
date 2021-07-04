import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/screens/addContact.dart';
import 'package:healthy_app/screens/editContact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'HomePage.dart';

class ListContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListContactState();
  }
}

class ListContactState extends State<ListContact> {
  User user = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;

  Future _calling(String url) async {
    print("fonction t3aytaat");

    if (await canLaunch(url)) {
      print("siiir");
      print(url);
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()));
          },
        ),
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
                  return Container(
                    child: new ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditContact(document),
                            ));
                      },
                      title: new Text(document["name"]),
                      trailing: IconButton(
                          icon: Icon(Icons.call),
                          color: Colors.green,
                          onPressed: () {
                            var phone = document["mobile"].toString();
                            _calling('tel:$phone');
                          }),
                      subtitle: new Text(document["mobile"]),
                    ),
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
