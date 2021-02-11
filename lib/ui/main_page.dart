import 'package:flutter/material.dart';
import 'package:venus_io/ui/dashboard.dart';
import 'package:venus_io/ui/footer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Scaffold(
          body: Dashboard(),
          backgroundColor: Color.fromRGBO(22, 21, 26, 1),
        ),
        // bottomNavigationBar: FooterBar(),
      ),
    );
  }
}
