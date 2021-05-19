import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailActivitePage extends StatefulWidget {
  final heroTag;
  final foodName;
  final ingridinat;

  DetailActivitePage(this.heroTag, this.foodName, this.ingridinat);

  @override
  _DetailActivitePageState createState() => _DetailActivitePageState();
}

class _DetailActivitePageState extends State<DetailActivitePage> {
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Details',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(children: [
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 82,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                )),
            Positioned(
              top: 30,
              left: (MediaQuery.of(context).size.width / 2) - 100,
              child: Hero(
                tag: widget.heroTag,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.heroTag),
                          fit: BoxFit.cover)),
                ),
              ),
              height: 200,
              width: 200,
            ),
            Positioned(
              top: 250,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      widget.foodName,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // width: 100,
                    height: 250,
                    // margin: EdgeInsets.only(top: 45),
                    decoration: BoxDecoration(
                        //  shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.ingridinat),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
