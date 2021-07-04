import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/classes/docierMedi.dart';
import 'package:healthy_app/pallete.dart';
import 'package:healthy_app/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String myuser,
      myemail,
      myPassworld,
      _groupSanguin,
      _poid,
      _taille,
      _dateNaissance;

  final _passworldControler = new TextEditingController();
  final _confirmePassworldControler = new TextEditingController();

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  User user = FirebaseAuth.instance.currentUser;
  Future<void> insertData(final docierMedi) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("docierMedicale").add(docierMedi);
  }

  DateTime _dateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateTime = DateTime.now();
  }

  void dropChange(String val) {
    setState(() {
      _groupSanguin = val;
    });
  }

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: myemail, password: myPassworld);
        Alert(context: context, title: "Your verification email has been sent")
            .show();
        await user.sendEmailVerification();
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Alert(context: context, title: "The password provided is too weak.")
              .show();
        } else if (e.code == 'email-already-in-use') {
          Alert(
                  context: context,
                  title: "The account already exists for that email.")
              .show();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(image: 'images/login2.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                    key: formstate,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.width * 0.1,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.length > 100)
                                      return "User can't to be larger then 100 letters ";
                                    else if (val.length < 2)
                                      return "User can't to be lesse then 2 letters ";
                                    return null;
                                  },
                                  onSaved: (val) {
                                    myuser = val;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Icon(
                                        Icons.person,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: "User",
                                    hintStyle: kBodyText,
                                  ),
                                  style: kBodyText,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (val) {
                                    if (val.length > 100)
                                      return "Email can't to be larger then 100 letters ";
                                    else if (val.length < 2)
                                      return "Email can't to be lesse then 2 letters ";
                                    return null;
                                  },
                                  onSaved: (val) {
                                    myemail = val;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Icon(
                                        Icons.person,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: "Email",
                                    hintStyle: kBodyText,
                                  ),
                                  style: kBodyText,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _passworldControler,
                                  validator: (String val) {
                                    if (val.length > 100)
                                      return "Passworld can't to be larger then 100 letters ";
                                    else if (val.length < 4)
                                      return "Passworld can't to be lesse then 4 letters ";
                                    return null;
                                  },
                                  onSaved: (val) {
                                    myPassworld = val;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Icon(
                                        Icons.lock,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: "Passworld",
                                    hintStyle: kBodyText,
                                  ),
                                  obscureText: true,
                                  style: kBodyText,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _confirmePassworldControler,
                                  validator: (String val) {
                                    if (val != _passworldControler.value.text) {
                                      return "Passworld do not match !";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Icon(
                                        Icons.lock,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: "Confirme Passworld",
                                    hintStyle: kBodyText,
                                  ),
                                  obscureText: true,
                                  style: kBodyText,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          "Date Naissance: ${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          height: 1.5),
                                      prefixIcon: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                        size: 28,
                                      )),
                                  onTap: () async {
                                    DateTime date = await showDatePicker(
                                        context: context,
                                        initialDate: _dateTime,
                                        firstDate: DateTime(1930),
                                        lastDate: DateTime(2022));
                                    if (date != null)
                                      setState(() {
                                        _dateTime = date;
                                        _dateNaissance =
                                            DateFormat('yyyy-MM-dd')
                                                .format(date);
                                      });
                                    print(
                                        "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}");
                                    print(_dateNaissance);
                                  },
                                  style: kBodyText,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.invert_colors,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        hintText: "Groupe sanguin",
                                        hintStyle: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            height: 1.5),
                                      ),
                                      onChanged: dropChange,
                                      value: _groupSanguin,
                                      items: <String>[
                                        "A+",
                                        "A-",
                                        "B+",
                                        "B-",
                                        "AB+",
                                        "AB-",
                                        "O+",
                                        "O-"
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          child: Text(value,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  height: 1.5)),
                                          value: value,
                                        );
                                      }).toList())),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  onSaved: (val) {
                                    _poid = val;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Icon(
                                        Icons.line_weight,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: "Poid (kg)",
                                    hintStyle: kBodyText,
                                  ),
                                  style: kBodyText,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  onSaved: (val) {
                                    _taille = val;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Icon(
                                        Icons.line_weight,
                                        size: 28,
                                        color: kWhite,
                                      ),
                                    ),
                                    hintText: "taille (cm)",
                                    hintStyle: kBodyText,
                                  ),
                                  style: kBodyText,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: size.height * 0.08,
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: kBlue,
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  UserCredential response = await signUp();
                                  print("===================");
                                  if (response != null) {
                                    final DocierMedi c = DocierMedi(
                                        username: myuser,
                                        email: myemail,
                                        poid: _poid,
                                        taille: _taille,
                                        dateN: _dateNaissance,
                                        groupSanguin: _groupSanguin,
                                        userId: response.user.uid);
                                    insertData(c.toMap());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  } else
                                    print("errrrrrrrrrrrr");
                                },
                                child: Text(
                                  "Enregistrer",
                                  style: kBodyText.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: kBodyText,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  child: Text(
                                    'Login',
                                    style: kBodyText.copyWith(
                                        color: kBlue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
