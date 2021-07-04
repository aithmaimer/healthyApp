import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:healthy_app/aide/profile/size_cofig.dart';
import 'package:healthy_app/classes/MedicamentPage.dart';
import 'package:healthy_app/screens/HomePage.dart';
import '../constant.dart';
import 'body.dart';

class ProfileScreen extends StatefulWidget {
  DocumentSnapshot document;
  ProfileScreen(this.document);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    /* return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );*/
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WelcomeScreen();
              }));
            },
          ),
          backgroundColor: mPrimaryTextColor,
          centerTitle: true,
          elevation: 0,
          title: Text("Profile")),
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
                              child: Body(document),
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
