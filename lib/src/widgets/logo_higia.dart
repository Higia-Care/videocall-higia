import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../constants/constants_ui.dart';

class LogoHigia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FadeInLeft(
          duration: Duration(milliseconds: 800),
          child: Text(
            "HIGIA",
            style: TextStyle(
                color: kHigiaTitleColor,
                fontSize: size.width * 0.21,
                fontFamily: 'gillBold'),
          ),
        ),
        FadeInLeft(
          delay: Duration(milliseconds: 1000),
          duration: Duration(milliseconds: 800),
          child: Text(
            "care",
            style: TextStyle(
                color: kHigiaCareTitleColor,
                fontSize: size.width * 0.14,
                fontFamily: 'gill'),
          ),
        )
      ],
    );
  }
}
