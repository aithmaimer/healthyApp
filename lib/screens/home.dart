import 'package:flutter/material.dart';
import 'package:healthy_app/screens/menu_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "my list Viwe",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Home Page"),
            ),
            drawer: MenuDrawer(),
            body: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.access_alarm),
                  title: Text("My alarm"),
                  subtitle: Text("the body of the alarm list"),
                  trailing: Icon(Icons.accessibility),
                  onTap: () {
                    // onclick(context);
                    debugPrint("heloo world");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.adb),
                  title: Text("My android"),
                  subtitle: Text("the body of the android list"),
                  trailing: Icon(Icons.image),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text("My account"),
                  trailing: Icon(Icons.account_circle),
                ),
              ],
            )));
  }
}
