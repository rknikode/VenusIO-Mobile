import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus_io/models/user.dart';
import 'package:venus_io/ui/raised_gradient_button.dart';
import 'package:http/http.dart' as http;
import 'package:venus_io/ui/snackbar.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFieldController = TextEditingController();
  var _loading = false;

  Future<void> login(context) async {
    if (_loginFieldController.text.isNotEmpty) {
      setState(() {
        _loading = true;
      });

      http
          .post(
        "https://venusdashboard.appspot.com/api/key/verify",
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'Key': _loginFieldController.text,
          'Device': "",
        }),
      )
          .then((response) {
        if (response.body == "Unauthorized") {
          showSnackbar(context, "Invalid key");
        } else {
          final user = User(
              id: 1,
              key: _loginFieldController.text,
              date: DateTime.now().toString());
          user.addUser(user);
          Navigator.of(context).pushReplacementNamed('/Dashboard');
        }

        setState(() {
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          Text(
            "Enter your key to login",
            style: GoogleFonts.raleway(
              fontStyle: FontStyle.normal,
              fontSize: 14.0,
              color: Color.fromRGBO(151, 154, 156, 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              controller: _loginFieldController,
              style: new TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (value) {
                login(context);
              },
              decoration: new InputDecoration(
                hintText: "XXX-XXX-XXXX",
                hintStyle: new TextStyle(color: Colors.white),
                fillColor: Color.fromRGBO(22, 21, 26, 1),
                border: InputBorder.none,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(48, 48, 48, 1), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.white)),
                filled: true,
                contentPadding:
                    EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.5,
            child: RaisedGradientButton(
                child: _loading
                    ? SpinKitRipple(
                        color: Colors.white,
                        size: 50.0,
                      )
                    : Text(
                        "LOGIN",
                        style: GoogleFonts.raleway(
                            fontSize: 19.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(29, 196, 196, 1),
                    Color.fromRGBO(47, 131, 177, 1),
                  ],
                ),
                onPressed: () {
                  login(context);
                }),
          )
        ],
      ),
    );
  }
}
