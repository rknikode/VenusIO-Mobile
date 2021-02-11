import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus_io/models/success_item_list.dart';

class ListItem extends StatelessWidget {
  final SuccessItemList listItem;
  ListItem(this.listItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(0, 255, 11, 1))),
      child: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.network(
                  listItem.itemUrl,
                  width: 60,
                  height: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(listItem.mainMsg,
                      style: GoogleFonts.montserrat(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      )),
                  Text(listItem.subMsg,
                      style: GoogleFonts.montserrat(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      )),
                  Text(listItem.taskNo + " " + listItem.dateTime,
                      style: GoogleFonts.montserrat(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        decoration: TextDecoration.none,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
