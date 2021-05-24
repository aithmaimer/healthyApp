import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthy_app/aide/profile/profile.dart';
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
      resizeToAvoidBottomInset: true,
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
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 82,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: ProfileScreen(document),
                            )
                          ],
                        )
                      ],
                    );
                  }).toList(),
                );
              })),
    );
  }
}
