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
           ));
  }
}
