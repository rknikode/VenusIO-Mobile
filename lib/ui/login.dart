import 'package:flutter/material.dart';
import './footer.dart';
import './app_header_logo.dart';
import './login_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppHeaderLogo(65.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoginForm(),
                ],
              ),
            ),
            // FooterBar()
          ],
        ),
        height: MediaQuery.of(context).size.height,
      )),
      backgroundColor: Color.fromRGBO(22, 21, 26, 1),
      bottomNavigationBar: FooterBar(),
    );
  }
}
