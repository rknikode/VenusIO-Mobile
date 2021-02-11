import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackbar(context, msg) {
  Scaffold.of(context).showSnackBar(new SnackBar(
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
          fontStyle: FontStyle.normal,
          fontSize: 18.0,
          decoration: TextDecoration.none,
          color: Color.fromRGBO(47, 131, 177, 1),
          // color: error
          //     ? Color.fromRGBO(255, 0, 0, 1)
          //     : Color.fromRGBO(47, 131, 177, 1),
          fontWeight: FontWeight.bold),
    ),
  ));
}
