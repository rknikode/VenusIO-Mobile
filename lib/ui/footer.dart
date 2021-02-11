import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          new Container(
            height: 30.0,
            padding: EdgeInsets.only(left: 10, right: 10),
            color: Color.fromRGBO(28, 29, 33, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Version 1.0.0",
                  style: GoogleFonts.montserrat(
                      fontSize: 13.0,
                      backgroundColor: Color.fromRGBO(28, 29, 33, 1),
                      color: Colors.white),
                ),
                Text(
                  "VenusIO Solutions",
                  style: GoogleFonts.montserrat(
                      fontSize: 13.0,
                      backgroundColor: Color.fromRGBO(28, 29, 33, 1),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(28, 29, 33, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Version 1.0.0",
                    style: GoogleFonts.montserrat(
                        fontSize: 13.0,
                        backgroundColor: Color.fromRGBO(28, 29, 33, 1),
                        color: Colors.white),
                  ),
                  Text(
                    "VenusIO Solutions",
                    style: GoogleFonts.montserrat(
                        fontSize: 13.0,
                        backgroundColor: Color.fromRGBO(28, 29, 33, 1),
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            // child: new CustomPaint(
            //   painter: Painter(),
            //   size: Size.infinite,
            // ),
          ),
        ],
      ),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset.zero, size.bottomRight(Offset.zero), Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // bad, but okay for example
    return true;
  }
}
