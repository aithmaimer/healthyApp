import 'package:flutter/material.dart';

import 'constant.dart';

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function press;

  const MenuCard({
    Key key,
    this.imageUrl,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Image.asset(
            imageUrl,
            width: 90,
            height: 90,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(
              color: mTitleTextColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}