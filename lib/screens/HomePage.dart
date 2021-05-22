import 'package:flutter/material.dart';
import 'package:healthy_app/aide/constant.dart';
import 'package:healthy_app/aide/foodTest.dart';
import 'package:healthy_app/aide/header.dart';
import 'package:healthy_app/aide/headerLogo.dart';
import 'package:healthy_app/aide/menucard.dart';
import 'package:healthy_app/screens/ActivitePage.dart';
import 'package:healthy_app/screens/addMedicament.dart';
import 'package:healthy_app/screens/home.dart';
import 'package:healthy_app/screens/information.dart';
import 'package:healthy_app/screens/listContacts.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 300,
            imageUrl: 'images/welcome.png',
            child: Column(
              children: <Widget>[
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
                  'Lorem ipsum dolor sit amet,\n consectetuer adipiscing elit',
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
          Expanded(
            child: Container(
              width: double.infinity,
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
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Our Health\nServices',
                          style: TextStyle(
                            color: mTitleTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: mSecondBackgroundColor,
                            size: 36,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                        ),
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
                                  builder: (context) => ListContact()));
                        },
                      ),
                      MenuCard(
                        imageUrl: 'images/medicament.jpg',
                        title: 'Medicament',
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMedicament()));
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
                                  builder: (context) => ActivitePage()));
                        },
                        imageUrl: 'images/activite.png',
                        title: 'Activités Physiques',
                      ),
                      MenuCard(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Information()));
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
    );
  }
}
