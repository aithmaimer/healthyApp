import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/aide/foodTest.dart';
import 'package:healthy_app/authentification/login.dart';
import 'package:healthy_app/screens/ActivitePage.dart';
import 'package:healthy_app/screens/AddDocierMedicale.dart';
import 'package:healthy_app/screens/addMedicament.dart';
import 'package:healthy_app/screens/listContacts.dart';
import 'package:healthy_app/screens/mapAncologie.dart';
import 'information.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 45),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/profile.jpg"),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
            ),
          ),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListContact(),
                      ));
                },
                title: Text("Contacts"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Information(),
                      ));
                },
                title: Text("informations"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodTest(),
                      ));
                },
                title: Text("Repas"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivitePage(),
                      ));
                },
                title: Text("Activiter phisiques"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapAncologie(),
                      ));
                },
                title: Text("Map"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDocierMedicale(),
                      ));
                },
                title: Text("Docier Medicale"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          Container(
              height: 50,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMedicament(),
                      ));
                },
                title: Text("Medicament"),
                leading: Icon(
                  Icons.group,
                  color: Colors.lightBlueAccent,
                ),
              )),
          RaisedButton(
            color: Colors.blue,
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              /* Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);*/
            },
            child: Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
