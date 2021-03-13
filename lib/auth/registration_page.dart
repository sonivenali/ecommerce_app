import 'package:flipkartapp/services/service.dart';
import 'package:flipkartapp/auth/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: FlatButton( minWidth: 170,
              height: 50,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
              },
              child: Text(
                "Regsiter",
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  register()async {
    Service servies = Service();
    var map = new Map<String, dynamic>();
    map['username'] = username.value.text;
    map['password'] = password.value.text;
    map['password2'] = password2.value.text;
    map['email'] = email.value.text;
    final abc = await servies.registervenali(map);
    print(abc);
    if (abc["refresh"] != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("Invalid credentials")));
    }
  }
}
