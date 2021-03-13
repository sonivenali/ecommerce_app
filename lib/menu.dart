import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Home",
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Image.network(
              "https://media.glassdoor.com/sqll/300494/flipkart-com-squarelogo-1433217726546.png",
              height: 40,
            ),
          ),
        ],
        leading: IconButton(
          color: Colors.white,
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          buildHomeButton(Icons.local_hospital, "Flipkart Plus Zone"),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          buildHomeButton(Icons.category, "All Categories"),
          buildHomeButton(Icons.more_horiz_rounded, "More on Flipkart"),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          buildHomeButton(Icons.language, "Choose Language"),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          buildHomeButton(Icons.local_offer, "Offer Zone"),
          buildHomeButton(Icons.shopping_bag, "Sell on Flipkart"),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          buildHomeButton(Icons.my_library_add, "My Order"),
          buildHomeButton(Icons.sticky_note_2, "My Coupons"),
          buildHomeButton(Icons.add_shopping_cart, "My Cart"),
          buildHomeButton(Icons.list, "My WishList"),
          buildHomeButton(Icons.account_circle, "My Order"),
          buildHomeButton(Icons.notifications, "My Order"),
          buildHomeButton(Icons.chat, "My Order"),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
            child: Text("Notification Preferences",textDirection: TextDirection.ltr,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
            child: Text("Help Center"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
            child: Text("Privacy Policy"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 8,left: 8),
            child: Text("Legal"),
          ),
        ],
      ),
    );
  }

  Padding buildHomeButton(
    IconData icon,
    String name,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 8),
            child: Icon(
              icon,
              color: Colors.grey[700],
            ),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
