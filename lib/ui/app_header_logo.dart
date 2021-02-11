import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeaderLogo extends StatelessWidget {
  double _topMargin;

  AppHeaderLogo(this._topMargin);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: _topMargin),
            child: Image.asset(
              "assets/images/logo2.png",
              width: 58,
              height: 58,
            ),
          ),
          Text("VenusIO",
              style: GoogleFonts.montserrat(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                decoration: TextDecoration.none,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
