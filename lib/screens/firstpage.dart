import 'package:flutter/material.dart';
import 'package:healthy_app/screens/AddDocierMedicale.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthy_app/screens/home.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  /* savePref(String go) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("go", go);
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var go = preferences.getString("go");
    if (go != null) {
      Navigator.of(context).pushNamed('homeScreen');
    } else if (go == null)
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AddDocierMedicale()));
  }

  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("qu'est ce que CancerHelp a faire ?"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: size.height * 0.1,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        //radius: size.width * 0.14,
                        backgroundColor: Colors.blue[300],
                        child: Icon(
                          Icons.collections_bookmark_outlined,
                          color: Colors.white,
                          size: size.width * 0.08,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Organisez ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text:
                                "vos informations sur le concer en un seul endroit.personaliser à vous.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        // radius: size.width * 0.14,
                        backgroundColor: Colors.blue[300],
                        child: Icon(
                          Icons.class__outlined,
                          color: Colors.white,
                          size: size.width * 0.08,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Enregistrer ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text:
                                "et suivre vos symptômes,vos état physique et psychologique.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        // radius: size.width * 0.14,
                        backgroundColor: Colors.blue[300],
                        child: Icon(
                          Icons.file_copy_outlined,
                          color: Colors.white,
                          size: size.width * 0.08,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Renseignez  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text:
                                "votre historique santé dans votre dossier médical.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        // radius: size.width * 0.14,
                        backgroundColor: Colors.blue[300],
                        child: Icon(
                          Icons.group,
                          color: Colors.white,
                          size: size.width * 0.08,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Contacter  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: "des professionnels de santé.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: ListTile(
                    leading: Container(
                      child: CircleAvatar(
                        // radius: size.width * 0.14,
                        backgroundColor: Colors.blue[300],
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: size.width * 0.1,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Rappel ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 15),
                          ),
                          TextSpan(
                            text: "du temps de prise de médicaments.",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
            ),
            child: Text(
              "To get started, we need to know a littel more about you.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blue[600],
        child: Container(
            height: 60,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              onPressed: () {
                //savePref("go");

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Let's go",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.none,
                ),
              ),
            )),
      ),
    );
  }
}
