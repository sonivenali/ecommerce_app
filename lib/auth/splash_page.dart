import 'package:flipkartapp/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/appicon.png",
                height: 100,
                width: 100,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Ecommerce",
                style: TextStyle(
                    fontSize: 20, letterSpacing: 4, color: Colors.blueGrey),
              ),
            )
          ],
        ),
      ),
    );
  }

  void redirectToLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
