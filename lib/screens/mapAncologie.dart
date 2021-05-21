import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapAncologie extends StatefulWidget {
  @override
  _MapAncologieState createState() => _MapAncologieState();
}

class _MapAncologieState extends State<MapAncologie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyMap")),
      body: Center(
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () async {
            if (await canLaunch(
                "https://www.google.com/maps/search/oncology+maroc/@33.0991727,-11.1186977,6.78z?hl=fr"))
              await launch(
                  "https://www.google.com/maps/search/oncology+maroc/@33.0991727,-11.1186977,6.78z?hl=fr");
            else
              throw "could not open Map";
          },
          child: Text(
            "Cliquer ici pour afficher le Map",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
