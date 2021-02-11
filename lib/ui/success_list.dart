import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus_io/models/success_item_list.dart';
import 'package:venus_io/ui/list_item.dart';
import 'package:http/http.dart' as http;
import 'package:venus_io/ui/raised_gradient_button.dart';
import 'package:venus_io/ui/snackbar.dart';

class SuccessList extends StatefulWidget {
  String _key;

  SuccessList(this._key);

  @override
  _SuccessListState createState() => _SuccessListState(_key);
}

class _SuccessListState extends State<SuccessList> {
  String _key;
  bool _loading = true;
  List<SuccessItemList> _itemList = [];

  void clearList(context) {
    setState(() {
      _loading = true;
    });
    http
        .delete("https://discord-rest-apis.herokuapp.com/api/items/$_key")
        .then((response) {
      final extrectedData = json.decode(response.body);
      if (extrectedData['status'] == "success") {
        setState(() {
          _itemList = [];
          _loading = false;
        });
        showSnackbar(context, "Items has been cleared");
      }
    });
  }

  _SuccessListState(this._key) {
    http
        .get("https://discord-rest-apis.herokuapp.com/api/items/$_key")
        .then((response) {
      final extrectedData = json.decode(response.body);

      var listData = (extrectedData['data'] as List)
          .map((i) => SuccessItemList.fromMap(i))
          .toList();

      setState(() {
        _itemList = listData;
        _loading = false;
      });
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
            height: MediaQuery.of(context).size.height * 0.25,
            child: Scrollbar(
                child: _loading
                    ? SpinKitDoubleBounce(
                        color: Colors.white,
                        size: 50.0,
                      )
                    : _itemList.length == 0
                        ? Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(0, 255, 11, 1))),
                            child: Text(
                              "No Items Found",
                              style: GoogleFonts.raleway(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : new ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _itemList.length,
                            itemBuilder: (BuildContext ctx, int item) {
                              return ListItem(_itemList[item]);
                            })),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 0),
            width: MediaQuery.of(context).size.width * 0.4,
            child: RaisedGradientButton(
                child: Text(
                  "CLEAR",
                  style: GoogleFonts.raleway(
                      fontSize: 19.0,
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(255, 0, 0, 1),
                    Color.fromRGBO(219, 0, 13, 1),
                  ],
                ),
                onPressed: () {
                  _itemList.length == 0 ? null : clearList(context);
                }),
          )
        ],
      ),
    );
  }
}
