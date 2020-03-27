import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/logo_higia.dart';
import '../constants/constants_ui.dart';
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
    final size = MediaQuery.of(context).size;
    final styleTextWelcome = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          LogoHigia(),
          SizedBox(height: size.height * 0.05),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Hola, bienvenido', style: styleTextWelcome),
                    Text('Para ingresar a la terapia ingrese su ID',
                        style: styleTextWelcome),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _channelController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    errorText: _validateError ? 'El ID es obligatorio' : null,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    hintText: 'Ingrese ID',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColorTheme)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColorTheme)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColorTheme)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColorTheme)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kprimaryColorTheme)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: onJoin,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Unirme a la terapia',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                color: ksecundaryHeaderColorTheme,
                textColor: Colors.white,
              ),
            ],
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
