import 'package:flutter/material.dart';

class AppBarHigia extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          higiaCareText(),
        ],
      ),
    );
  }

  Row higiaCareText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          "HIGIA ",
          style: TextStyle(fontSize: 33, fontFamily: 'gillBold'),
        ),
        Text(
          "CARE",
          style: TextStyle(fontSize: 20, fontFamily: 'gill'),
        ),
      ],
    );
  }
}
