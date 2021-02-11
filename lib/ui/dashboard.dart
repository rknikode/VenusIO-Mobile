import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venus_io/models/user.dart';
import 'package:venus_io/ui/raised_gradient_button.dart';
import 'package:venus_io/ui/snackbar.dart';
import './footer.dart';
import './success_list.dart';
import './reset_licance_form.dart';
import './app_header_logo.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _loading = false;
  String _key;

  var loader = SpinKitDoubleBounce(
    color: Colors.white,
    size: 50.0,
  );

  Future<void> getUserKey() async {
    User user = new User();
    var data = (await user.getUser(1)).key;
    setState(() {
      _key = data;
    });
  }

  Future _loadingDone() async {
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    setState(() {
      getUserKey();
      _loading = true;
      new Future.delayed(new Duration(seconds: 1), _loadingDone);
    });
  }

  void logOutUser(context) async {
    User user = new User();
    var success = await user.deleteUser(1);
    if (success == 1) {
      showSnackbar(context, "Successfully Logout");
    } else {
      showSnackbar(context, "Invalid User");
    }
  }

  @override
  Widget build(BuildContext widcontext) {
    return MaterialApp(
        title: "VenusIO",
        home: Theme(
          data: ThemeData(highlightColor: Color.fromRGBO(47, 131, 177, 1)),
          child: new Scaffold(
            body: _loading
                ? loader
                : Builder(builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: new Column(
                        children: <Widget>[
                          AppHeaderLogo(40.0),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 0, bottom: 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "KEY INFORMATION:",
                                      style: GoogleFonts.roboto(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(151, 154, 156, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                ResetLicanceForm(_key),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "SUCCESS:",
                                      style: GoogleFonts.roboto(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0,
                                        decoration: TextDecoration.none,
                                        color: Color.fromRGBO(151, 154, 156, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                SuccessList(_key),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 0),
                                      width: 150,
                                      child: RaisedGradientButton(
                                          child: Text(
                                            "DASHBOARD",
                                            style: GoogleFonts.raleway(
                                                fontSize: 19.0,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                          onPressed: () {}),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 0),
                                      width: 150,
                                      child: RaisedGradientButton(
                                          child: Text(
                                            "LOGOUT",
                                            style: GoogleFonts.raleway(
                                                fontSize: 19.0,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                            logOutUser(context);
                                            Navigator.of(widcontext)
                                                .pushReplacementNamed("/Login");
                                          }),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            backgroundColor: Color.fromRGBO(22, 21, 26, 1),
            bottomNavigationBar: FooterBar(),
          ),
        ));
  }
}
