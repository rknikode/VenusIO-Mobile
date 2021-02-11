import 'package:flutter/material.dart';
import 'package:venus_io/ui/main_page.dart';
import './ui/dashboard.dart';
import './ui/home.dart';
import './ui/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VenusIO',
      // home: new BrowserSpoofer(),
      home: new Home(),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new Login(),
        '/Dashboard': (BuildContext context) => new Dashboard(),
        '/MainPage': (BuildContext context) => new MainPage(),
      },
    );
  }
}
