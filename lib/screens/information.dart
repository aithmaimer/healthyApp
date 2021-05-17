import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Query<Map<String, dynamic>> cancer =
        FirebaseFirestore.instance.collection('cancer');

    return Scaffold(
      appBar: AppBar(
        title: Text('Selet Type '),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: cancer.snapshots(),
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
                            builder: (context) => DetailPage(document),
                          ));
                    },
                    title: new Text(document["titre"]),
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

class DetailPage extends StatefulWidget {
  DocumentSnapshot document;
  DetailPage(this.document);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document['titre'])),
      body: Container(
        child: ListTile(
          title: Text(widget.document['titre']),
          subtitle: Text(widget.document['texte']),
        ),
      ),
    );
  }
}
