import 'package:flutter/material.dart';
import 'package:healthy_app/screens/menu_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            body: Center(
              child: Column(children: <Widget>[
                FloatingActionButton(
                  // onPressed: showNotification,
                  onPressed: () {},
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ]),
            )));
  }
}
