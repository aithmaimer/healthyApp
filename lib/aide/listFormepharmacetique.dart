import 'package:flutter/material.dart';
import 'package:healthy_app/classes/MedicamentPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';

class ListPharmacetique extends StatefulWidget {
  @override
  _ListPharmacetiqueState createState() => _ListPharmacetiqueState();
}

class _ListPharmacetiqueState extends State<ListPharmacetique> {
  List<String> type = [
    "Comprimé",
    "Gélule",
    "sirop/Solution buvable",
    "Ambule",
    "Goutte",
    "injection",
    "Collyre",
    //"inhalation",
    "Suppositoire",
  ];
  List<Icon> ficon = [
    Icon(FontAwesomeIcons.tablets),
    Icon(FontAwesomeIcons.capsules),
    Icon(FontAwesomeIcons.utensilSpoon),
    Icon(FontAwesomeIcons.thermometer),
    Icon(FontAwesomeIcons.tint),
    Icon(FontAwesomeIcons.syringe),
    Icon(FontAwesomeIcons.eyeDropper),
    Icon(FontAwesomeIcons.joint),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("selectioner un type"),
        backgroundColor: mYellowColor,
      ),
      body: ListView.builder(
        itemCount: type.length,
        itemBuilder: (context, pos) {
          return new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicamentPage(),
                  settings: RouteSettings(
                    arguments: type[pos],
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(icon: ficon[pos], onPressed: () {}),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      type[pos],
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
