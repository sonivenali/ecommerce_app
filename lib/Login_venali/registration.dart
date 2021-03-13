import 'package:flipkartapp/Services.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'loginvenali.dart';

class RegisterVenali extends StatefulWidget {
  @override
  _RegisterVenaliState createState() => _RegisterVenaliState();
}

class _RegisterVenaliState extends State<RegisterVenali> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Username"),
            controller: username,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            controller: password,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Confirm Password"),
            controller: password2,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Email"),
            controller: email,
          ),
          RaisedButton(
            onPressed: () {
              register();
            },
            child: Text(
              "Register",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ));
  }

  register()async {
    Services servies = Services();
    var map = new Map<String, dynamic>();
    map['username'] = username.value.text;
    map['password'] = password.value.text;
    map['password2'] = password2.value.text;
    map['email'] = email.value.text;
    final abc = await servies.registervenali(map);
    print(abc);
    if (abc["refresh"] != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginVenali()));
    } else {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Invalid credentials")));
    }
  }
}
