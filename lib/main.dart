import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/authentification/authentification.dart';
import 'package:healthy_app/screens/firstpage.dart';
import 'package:healthy_app/screens/home.dart';
import 'package:healthy_app/classes/docier_medicale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'maladie',
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        textTheme:
            GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'firstPage': (context) => FirstPage(),
        'homeScreen': (context) => Home(),
        'DocierMedicale': (context) => DocierMedicale(),
      },
    );
  }
}
