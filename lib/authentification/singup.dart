import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthy_app/pallete.dart';
import 'package:healthy_app/widgets/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateNewAccount extends StatelessWidget {
  String myuser, myemail, myPassworld;
  final _passworldControler = new TextEditingController();
  final _confirmePassworldControler = new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    signUp() async {
      var formdata = formstate.currentState;
      if (formdata.validate()) {
        formdata.save();
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: myemail, password: myPassworld);
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
                        Stack(
                          children: [
                            Center(
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: CircleAvatar(
                                    radius: size.width * 0.14,
                                    backgroundColor:
                                        Colors.grey[400].withOpacity(
                                      0.4,
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.user,
                                      color: kWhite,
                                      size: size.width * 0.1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
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
                              height: 25,
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
                              height: 25,
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
                              height: 25,
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
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
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
                                    Navigator.of(context).pushNamed("/");
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
