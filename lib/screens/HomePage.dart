import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/authentification/authentification.dart';

import 'package:healthy_app/screens/AddDocierMedicale.dart';
import 'package:healthy_app/screens/acueil.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  User user = FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  Query<Map<String, dynamic>> docier =
      FirebaseFirestore.instance.collection('docierMedicale');
  Future<void> getUserData() async {
    User userData = await FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
    });
  }

  int _currentIndex = 0;
  final List pages = [
    Acueil(),
    AddDocierMedicale(),
  ];

  @override
  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('contacts')
        .where('userId', isEqualTo: user.uid);
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Color(0xFFBCCBF3),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Profile'),
            backgroundColor: Color(0xFFBCCBF3),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                // auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            title: Text('Logout'),
            backgroundColor: Color(0xFFBCCBF3),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
