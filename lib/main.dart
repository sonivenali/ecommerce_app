import 'package:flipkartapp/postAPI/LoginApi.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'Login_venali/registration.dart';
import 'home.dart';

void main() {
  runApp(flipkart());
}

class flipkart extends StatefulWidget {
  @override
  _flipkartState createState() => _flipkartState();
}

class _flipkartState extends State<flipkart> {
  String loginToken;

  @override
  void initState() {
    //sp
    getLoginToeknValuefromSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginToken != null ? HomeScreen() : Login(),
    );
  }

  getLoginToeknValuefromSharedPreference() async {
    //sp
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginToken = prefs.getString("LoginToken");
    });
    print("this is logintoken value $loginToken");
  }
}
