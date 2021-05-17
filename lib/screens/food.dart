import 'package:flutter/material.dart';
import 'package:healthy_app/screens/detailFoodPage.dart';
import 'package:healthy_app/screens/home.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Restaurant',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Food',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(65.0))),
            child: ListView(
              // primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              children: <Widget>[
                /*
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 300,

                      */

                // child:
                Container(
                  padding: EdgeInsets.only(top: 5.0),
                  height: MediaQuery.of(context).size.height - 300,
                  child: ListView(
                    children: <Widget>[
                      _bulidFoodItem('images/plate1.png', "dish 1", "\$ 50.00",
                          "sokar atay"),
                      _bulidFoodItem('images/plate2.png', "dish 2", "\$ 24.00",
                          "sokar hlib"),
                      _bulidFoodItem('images/plate3.png', "dish 3", "\$ 10.00",
                          "sokar hlib"),
                      _bulidFoodItem('images/plate4.png', "dish 4", "\$ 100.00",
                          "sokar hlib"),
                      _bulidFoodItem('images/plate5.png', "dish 5", "\$ 60.00",
                          "sokar hlib"),
                      _bulidFoodItem('images/plate6.png', "dish 6", "\$ 77.00",
                          "sokar hlib"),
                    ],
                  ),
                ),
                //  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bulidFoodItem(
      String imgPath, String foodName, String price, String ingrediant) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  DetailFoodPage(imgPath, foodName, price, ingrediant)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: imgPath,
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        foodName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
