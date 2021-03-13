import 'package:carousel_extended/carousel_extended.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flipkartapp/electronic/electronics_page.dart';
import 'package:flipkartapp/home/menu.dart';
import 'package:flipkartapp/mobile/mobile_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../fashion/fashion_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchBarController = SearchBarController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (newIndex) {
          print("this is newindex $newIndex");
          setState(() => _index = newIndex);
          if(newIndex == 1){
            print("inside 1");
            Share.share('hellowvenali it is', );
          }
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
                color: Colors.grey[800],
              ),
              title: Text("Blue")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer,
                color: Colors.grey[800],
              ),
              title: Text("Orange")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_rounded,
                color: Colors.grey[800],
              ),
              title: Text("Red")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.video_library,
                color: Colors.grey[800],
              ),
              title: Text("Red")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fast_forward_outlined,
                color: Colors.grey[800],
              ),
              title: Text("Red")),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Flipkart",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              Menu();
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              color: Colors.blueAccent,
              child: SearchBar<String>(
                searchBarStyle: SearchBarStyle(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5)),
                searchBarPadding: EdgeInsets.symmetric(horizontal: 16),
                onSearch: (text) => Future.value([text]),
                searchBarController: searchBarController,
                emptyWidget: Text("empty"),
                indexedScaledTileBuilder: (int index) =>
                    ScaledTile.count(1, index.isEven ? 2 : 1),
                onCancelled: () {},
                onItemFound: (String text, int index) {
                  return Container();
                },
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  buildListButton(
                      "https://rukminim1.flixcart.com/flap/128/128/image/f15c02bfeb02d15d.png?q=100",
                      "Top Offers"),
                  buildListButton(
                      "https://rukminim1.flixcart.com/flap/128/128/image/22fddf3c7da4c4f4.png?q=100",
                      "Grocery"),
                  GestureDetector( onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MobilePage()),
                    );
                  },
                    child: buildListButton(
                        "https://rukminim1.flixcart.com/flap/128/128/image/82b3ca5fb2301045.png?q=100",
                        "Mobile"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FashionPage()),
                      );
                    },
                    child: buildListButton(
                        "https://rukminim1.flixcart.com/flap/128/128/image/69c6589653afdb9a.png?q=100",
                        "Fashion"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ElectronicsPage()),
                      );
                    },
                    child: buildListButton(
                        "https://rukminim1.flixcart.com/flap/128/128/image/ee162bad964c46ae.png?q=100",
                        "Electronics"),
                  ),
                  buildListButton(
                      "https://rukminim1.flixcart.com/flap/128/128/image/0ff199d1bd27eb98.png?q=100",
                      "Home"),
                  buildListButton(
                      "https://rukminim1.flixcart.com/flap/128/128/image/71050627a56b4693.png?q=100",
                      "Appliances"),
                  buildListButton(
                      "https://rukminim1.flixcart.com/flap/128/128/image/dff3f7adcf3a90c6.png?q=100",
                      "Travel"),
                ],
              ),
            ),
            Container(
              height: 150,
              child: Carousel(
                autoplay: false,
                pageController: PageController(),
                images: [
                  NetworkImage(
                      "https://rukminim1.flixcart.com/flap/2000/140/image/279850e55103833a.jpg?q=50"),
                  NetworkImage(
                      "https://rukminim1.flixcart.com/flap/2000/140/image/49c9af2551609332.jpg?q=50"),
                  NetworkImage(
                      "https://rukminim1.flixcart.com/flap/2000/140/image/a0a516910c71ebf4.jpg?q=50"),
                  NetworkImage(
                      "https://rukminim1.flixcart.com/flap/2000/140/image/2f6175ff8c0cdc74.jpg?q=50"),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.white,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.black.withOpacity(0.5),
                borderRadius: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.network(
                        "https://rukminim1.flixcart.com/flap/3000/80/image/160d14852e17d114.jpg?q=50",
                      )),
                  Expanded(
                      flex: 1,
                      child: Image.network(
                        "https://rukminim1.flixcart.com/flap/3000/80/image/639d22bbe2fb0902.jpg?q=50",
                      )),
                  Expanded(
                      flex: 1,
                      child: Image.network(
                        "https://rukminim1.flixcart.com/flap/3000/80/image/2afbd56824d408fb.jpg?q=50",
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildListButton(String imageLink, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 2, right: 4, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imageLink,
            height: 50,
            width: 50,
          ),
          Text(title)
        ],
      ),
    );
  }
}
