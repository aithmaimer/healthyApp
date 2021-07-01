import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/classes/MedicamentPage.dart';
import 'package:healthy_app/screens/showMedicament.dart';

class ListMedicament extends StatefulWidget {
  @override
  _ListMedicamentState createState() => _ListMedicamentState();
}

class _ListMedicamentState extends State<ListMedicament> {
  User user = FirebaseAuth.instance.currentUser;

  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Query<Map<String, dynamic>> medicament = FirebaseFirestore.instance
        .collection('Medicament')
        .where('userId', isEqualTo: user.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicament'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MedicamentPage();
              }));
            },
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: medicament.snapshots(),
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
                  return Card(
                    child: new ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMedicament(document),
                            ));
                      },
                      title: new Text(
                        document["nomMedicament"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18),
                      ),
                      trailing: Icon(Icons.navigate_next),
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
