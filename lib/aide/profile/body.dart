import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/aide/profile/size_cofig.dart';

import 'info.dart';

class Body extends StatefulWidget {
  DocumentSnapshot document;
  Body(this.document);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "images/profile.jpg",
            name: widget.document['username'],
          ),
          SizedBox(height: SizeConfig.defaultSize * 2),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          Card(
            child: SizedBox(
              height: 70,
              child: new ListTile(
                title: new Text(
                  "email : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                subtitle: new Text(
                  " \t \t" + widget.document["email"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 70,
              child: new ListTile(
                title: new Text(
                  "Date De Naissance : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                subtitle: Row(
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    new Text(
                      widget.document["date_naissance"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 70,
              child: new ListTile(
                title: new Text(
                  "Group Sanguin :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                subtitle: Row(
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    new Text(
                      widget.document["group_sanguin"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 70,
              child: new ListTile(
                title: new Text(
                  "Poid:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                subtitle: Row(
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    new Text(
                      widget.document["poid"] + " (kg)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: 70,
              child: new ListTile(
                title: new Text(
                  "Taille :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                subtitle: Row(
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    new Text(
                      widget.document["taille"] + " (cm)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
