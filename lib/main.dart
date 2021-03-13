import 'package:flipkartapp/auth/login_page.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_page.dart';

void main() {
  runApp(Flipkart());
}

class Flipkart extends StatefulWidget {
  @override
  _FlipkartState createState() => _FlipkartState();
}

class _FlipkartState extends State<Flipkart> {
  String loginToken;

  @override
  void initState() {
    super.initState();
    getLoginTokenValueFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginToken != null ? HomePage() : LoginPage(),
    );
  }

  getLoginTokenValueFromSharedPreferences() async {
    //sp
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginToken = prefs.getString("LoginToken");
    });
    print("this is logintoken value $loginToken");
  }
}
