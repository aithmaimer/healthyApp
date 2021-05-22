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
                  return Card(
                    child: new ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoreInfo(document),
                            ));
                      },
                      title: new Text(
                        document["titre"],
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

class MoreInfo extends StatefulWidget {
  DocumentSnapshot document;
  MoreInfo(this.document);
  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document['titre'])),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
                height: 50,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(widget.document),
                        ));
                  },
                  title: Text("What is it"),
                )),
            Container(
                height: 50,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CausesPage(widget.document),
                        ));
                  },
                  title: Text("causes"),
                )),
            Container(
                height: 50,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TraitementPage(widget.document),
                        ));
                  },
                  title: Text("traitement"),
                )),
          ],
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
  String copie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document['titre'])),
      body: Container(
        child: Center(
          child: ListTile(
            title: Text(widget.document['whatis']),
          ),
        ),
      ),
    );
  }
}

class CausesPage extends StatefulWidget {
  DocumentSnapshot document;
  CausesPage(this.document);
  @override
  _CausesPageState createState() => _CausesPageState();
}

class _CausesPageState extends State<CausesPage> {
  String copie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document['titre'])),
      body: Container(
        child: Center(
          child: ListTile(
            title: Text(widget.document['causes']),
          ),
        ),
      ),
    );
  }
}

class TraitementPage extends StatefulWidget {
  DocumentSnapshot document;
  TraitementPage(this.document);
  @override
  _TraitementPageState createState() => _TraitementPageState();
}

class _TraitementPageState extends State<TraitementPage> {
  String copie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.document['titre'])),
      body: Container(
        child: Center(
          child: ListTile(
            title: Text(widget.document['traitement']),
          ),
        ),
      ),
    );
  }
}
