import 'package:agora_flutter_quickstart/src/constants/constants_ui.dart';
import 'package:flutter/material.dart';

class LogoHigia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "HIGIA",
          style: TextStyle(
              color: kHigiaTitleColor,
              fontSize: size.width * 0.21,
              fontFamily: 'gillBold'),
        ),
        Text(
          "care",
          style: TextStyle(
              color: kHigiaCareTitleColor,
              fontSize: size.width * 0.14,
              fontFamily: 'gill'),
        )
      ],
    );
  }
}
