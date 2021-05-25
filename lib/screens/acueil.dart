import 'package:flutter/material.dart';
import 'package:healthy_app/aide/constant.dart';
import 'package:healthy_app/aide/foodTest.dart';
import 'package:healthy_app/aide/header.dart';
import 'package:healthy_app/aide/headerLogo.dart';
import 'package:healthy_app/aide/menucard.dart';
import 'package:healthy_app/screens/ActivitePage.dart';
import 'package:healthy_app/screens/ListMedicament.dart';
import 'package:healthy_app/screens/information.dart';
import 'package:healthy_app/screens/listContacts.dart';
import 'package:url_launcher/url_launcher.dart';

class Acueil extends StatefulWidget {
  @override
  _AcueilState createState() => _AcueilState();
}

class _AcueilState extends State<Acueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    MyHeader(
                      height: 290,
                      imageUrl: 'images/welcome.png',
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 26,
                          ),
                          HeaderLogo(),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 28,
                              color: mTitleTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "N'abandonnez pas.\nSoyez fort et positif",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 900,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [mBackgroundColor, mSecondBackgroundColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Our Health\nServices',
                                    style: TextStyle(
                                      color: mTitleTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MenuCard(
                                  imageUrl: 'images/contactss.jpg',
                                  title: 'Contact',
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListContact()));
                                  },
                                ),
                                MenuCard(
                                  imageUrl: 'images/medicament.jpg',
                                  title: 'Medicament',
                                  press: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListMedicament()));
                                  },
                                ),
                                MenuCard(
                                  imageUrl: 'images/map.jpg',
                                  title: 'Centre Ancologie',
                                  press: () async {
                                    if (await canLaunch(
                                        "https://www.google.com/maps/search/oncology+maroc/@33.0991727,-11.1186977,6.78z?hl=fr"))
                                      await launch(
                                          "https://www.google.com/maps/search/oncology+maroc/@33.0991727,-11.1186977,6.78z?hl=fr");
                                    else
                                      throw "could not open Map";
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MenuCard(
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FoodTest()));
                                  },
                                  imageUrl: 'images/repas.jpg',
                                  title: 'Repas',
                                ),
                                MenuCard(
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ActivitePage()));
                                  },
                                  imageUrl: 'images/activite.png',
                                  title: 'Activités Physiques',
                                ),
                                MenuCard(
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Information()));
                                  },
                                  imageUrl: 'images/information.jpg',
                                  title: 'Information',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
