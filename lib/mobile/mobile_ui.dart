import 'package:flutter/material.dart';

import '../Services.dart';
import 'model.dart';

class MobileUI extends StatefulWidget {
  @override
  _MobileUIState createState() => _MobileUIState();
}

class _MobileUIState extends State<MobileUI> {
  List<Mobile> Mobile22;    //storedata

  @override
  void initState() {  //get function call hota hai
    super.initState();
    getMobileData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Mobile22 == null
          ? CircularProgressIndicator()
          : GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: Mobile22.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Text(Mobile22[index].name),
                      Text(Mobile22[index].price),
                      Image.network(
                        Mobile22[index].image,

                        height:100,
//
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }

  getMobileData() async {
    List<Mobile> MobileData;
    Services services = Services();
    MobileData = await services.getMobile();
    setState(() {
      Mobile22 = MobileData;
    });
  }
}
