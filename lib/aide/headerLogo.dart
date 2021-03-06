import 'package:flutter/material.dart';

import 'constant.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            width: 36,
            height: 36,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'CancerHelp',
            style: TextStyle(
                fontSize: 30,
                color: mTitleTextColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
