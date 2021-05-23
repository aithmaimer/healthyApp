import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/authentification/authentification.dart';

import 'package:healthy_app/screens/AddDocierMedicale.dart';
import 'package:healthy_app/screens/listContacts.dart';

Future<void> main() async {
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
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'AddDocierMedicale': (context) => AddDocierMedicale(),
        'ListContact': (context) => ListContact(),
      },
    );
  }
}
