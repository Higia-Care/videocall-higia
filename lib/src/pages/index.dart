import 'dart:async';

import 'package:agora_flutter_quickstart/src/constants/constants_ui.dart';
import 'package:agora_flutter_quickstart/src/widgets/appBar_higia.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "HIGIA",
                style: TextStyle(
                    color: kHigiaTitleColor,
                    fontSize: 80,
                    fontFamily: 'gillBold'),
              ),
              Text(
                "care",
                style: TextStyle(
                    color: kHigiaCareTitleColor,
                    fontSize: 50,
                    fontFamily: 'gill'),
              )
            ],
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        controller: _channelController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.perm_identity),
                          errorText: _validateError
                              ? 'Channel name is mandatory'
                              : null,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                          hintText: 'Ingrese id',
                        ),
                      ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: onJoin,
                            child: Text('Unirme a la reunion'),
                            color: ksecundaryHeaderColorTheme,
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
