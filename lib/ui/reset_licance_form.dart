import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus_io/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:venus_io/ui/raised_gradient_button.dart';
import 'dart:convert';

import 'package:venus_io/ui/snackbar.dart';

class ResetLicanceForm extends StatefulWidget {
  final _key;

  ResetLicanceForm(this._key) : super();

  @override
  _ResetLicanceFormState createState() => _ResetLicanceFormState(_key);
}

class _ResetLicanceFormState extends State<ResetLicanceForm> {
  var _licanceFieldController = TextEditingController();
  var _key;

  _ResetLicanceFormState(this._key);

  Future<void> resetLicance(context) async {
    http.post('https://copbrowser.com/authorize/logout/$_key').then((response) {
      var data = json.decode(response.body);
      if (data['error']) {
        showSnackbar(context, data['error_message']);
      } else {
        showSnackbar(context, "Key Successfully Reseted");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(48, 48, 48, 1)),
          borderRadius: BorderRadius.circular(3)),
      child: new Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Licance",
                style: GoogleFonts.raleway(
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(top: 6),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            // decoration: BoxDecoration(
            //     border: Border.all(
            //         color: Color.fromRGBO(48, 48, 48, 1), width: 2.0)),
            child: TextField(
              controller: _licanceFieldController,
              enabled: false,
              style: new TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                // hintText: "XXX-XXX-XXXX",
                hintText: _key,
                hintStyle: new TextStyle(color: Colors.white),
                fillColor: Color.fromRGBO(22, 21, 26, 1),
                border: InputBorder.none,
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(48, 48, 48, 1), width: 2.0),
                ),
                disabledBorder: const OutlineInputBorder(
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
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width * 0.6,
            child: RaisedGradientButton(
                child: Text(
                  "RESET",
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
                  resetLicance(context);
                }),
          )
        ],
      ),
    );
  }
}
