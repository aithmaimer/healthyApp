import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/pallete.dart';
import 'package:healthy_app/widgets/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatelessWidget {
  String myemail, myPassworld;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LogIn() async {
      var formdata = formstate.currentState;
      if (formdata.validate()) {
        formdata.save();
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: myemail, password: myPassworld);
          if (auth.currentUser.emailVerified == false) {
            Alert(context: context, title: "Please verify your email first")
                .show();
          } else
            Navigator.of(context).pushNamed("firstPage");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Alert(context: context, title: "No user found for that email.")
                .show();
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            Alert(
                    context: context,
                    title: "Wrong password provided for that user.")
                .show();
            print('Wrong password provided for that user.');
          }
        }
      }
    }

    return Stack(
      children: [
        BackgroundImage(
          image: 'images/login2.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: formstate,
            child: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      'CancerHelp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                    SizedBox(height: 20),
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'ForgotPassword'),
                      child: Text(
                        'Forgot Password',
                        style: kBodyText,
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
                          await LogIn();
                        },
                        child: Text(
                          "Login",
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                  child: Container(
                    child: Text(
                      'Create New Account',
                      style: kBodyText,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: kWhite))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
