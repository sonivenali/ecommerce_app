import 'dart:convert';

import 'package:flipkartapp/FashionExample/Models.dart';
import 'package:flipkartapp/Services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class FashionModelUI extends StatefulWidget {
  @override
  _FashionModelUIState createState() => _FashionModelUIState();
}

class _FashionModelUIState extends State<FashionModelUI> {
  List<FashionModel> fashionData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fashionData == null
          ? CircularProgressIndicator()
          : ListView.builder( // generates a list using itemCount and itemBUilder

        itemCount: fashionData.length,

        itemBuilder: (context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(fashionData[index].title),
                    Image.network(fashionData[index].image),
                    Text(fashionData[index].price.toString())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }



  getData() async{
    List<FashionModel> fashionDaata;
    Services services = Services();
    fashionDaata = await services.getFashionListModel();
    setState(() {
      fashionData  = fashionDaata;
    });
    print("thsi si dataaaaa ${fashionData[1].title}");
  }

}
