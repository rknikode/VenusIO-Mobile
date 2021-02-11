import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _navigationPath;
  navigatePage() async {
    User user = new User();
    var data = await user.getUser(1);
    if (data == null) {
      _navigationPath = '/Login';
    } else {
      _navigationPath = '/MainPage';
    }
    startTime();
  }

  @override
  void initState() {
    super.initState();
    navigatePage();
  }

  navigationPage() {
    Navigator.of(context).pushReplacementNamed(_navigationPath);
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                "assets/images/logo2.png",
                fit: BoxFit.cover,
                width: 58,
                height: 58,
              ),
            ),
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "LOADING",
              style: GoogleFonts.raleway(
                fontStyle: FontStyle.normal,
                fontSize: 14.0,
                decoration: TextDecoration.none,
                color: Color.fromRGBO(151, 154, 156, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
