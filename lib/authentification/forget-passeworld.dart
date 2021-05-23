import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_app/pallete.dart';
import 'package:healthy_app/widgets/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPassword extends StatelessWidget {
  String _email;
  final auth = FirebaseAuth.instance;

  GlobalKey<FormState> formstateForgetPass = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    resetEmail() async {
      var formdata = formstateForgetPass.currentState;
      if (formdata.validate()) {
        formdata.save();
        auth.sendPasswordResetEmail(email: _email);
        Navigator.of(context).pushNamed("/");
      }
    }

    return Stack(
      children: [
        BackgroundImage(image: 'images/login2.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: Text(
              'Forgot Password',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Form(
                key: formstateForgetPass,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          'Enter your email we will send instruction to reset your password',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[500].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          validator: (val) {
                            if (val.length > 100)
                              return "User can't to be larger then 100 letters ";
                            else if (val.length < 2)
                              return "User can't to be lesse then 2 letters ";
                            return null;
                          },
                          onSaved: (String val) {
                            _email = val;
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
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: Text(
                          "Send",
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          await resetEmail();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
