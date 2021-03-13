import 'dart:convert';

import 'package:flipkartapp/auth/registration_page.dart';
import 'package:flipkartapp/services/service.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _namecntrlr = TextEditingController();
  TextEditingController _psswrdcntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: FlatButton( minWidth: 170,
                      height: 50,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        _login(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white,fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    "Don't have an account? Register here",
                    style: TextStyle(color: Colors.blue),
                  ),
                  minWidth: 120,
                  height: 50,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login(contextt) async {
    Service services = Service();
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
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (data["error"]["statusCode"] == 401) {
      print("wrongggg");
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Invalid credentials")));
    }
  }
}
