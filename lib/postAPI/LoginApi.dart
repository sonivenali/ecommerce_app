import 'dart:convert';

import 'package:flipkartapp/Services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _namecntrlr = TextEditingController();
  TextEditingController _psswrdcntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Username",
              ),
              controller: _namecntrlr,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Password"),
              controller: _psswrdcntrl,
            ),
            RaisedButton(
              onPressed: () {
                _login(context);
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void _login(contextt) async {
    Services services = Services();
    print(_namecntrlr.value.text);
    final reqbody = {
      "username": _namecntrlr.value.text,
      "password": _psswrdcntrl.value.text
    };
    final data = await services.loginApi(jsonEncode(reqbody));
    print(data);
    if (data["refresh"] != null) {
      print("inside iffff");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (data["error"]["statusCode"] == 401) {
      print("wrongggg");
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Invalid credentials")));
    }
  }
}
