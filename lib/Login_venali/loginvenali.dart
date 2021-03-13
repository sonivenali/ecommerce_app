import 'package:flipkartapp/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services.dart';

class LoginVenali extends StatefulWidget {
  @override
  _LoginVenaliState createState() => _LoginVenaliState();
}

class _LoginVenaliState extends State<LoginVenali> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(decoration: InputDecoration(labelText: "Username"),
              controller: username,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
              controller: password,
            ),
            RaisedButton(onPressed: () {
              callLoginApi();
            }, child: Text("Sign in"))
          ],
        ),
      ),
    );
  }

  callLoginApi() async {
    Services servies = Services();
    var map = new Map<String, dynamic>();
    map['username'] = username.value.text;
    map['password'] = password.value.text;

    final abc = await servies.loginApi(map);
    print("abc $abc");

    if (abc["refresh"] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();// sp
      await prefs.setString('LoginToken', abc["refresh"]);  //sp
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else{
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Invalid credentials")));   // for error
    }
  }


}
