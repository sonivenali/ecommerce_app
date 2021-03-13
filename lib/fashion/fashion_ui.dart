
import 'package:flipkartapp/fashion/models.dart';
import 'package:flipkartapp/Services.dart';
import 'package:flutter/material.dart';



class FashionModelUI extends StatefulWidget {
  @override
  _FashionModelUIState createState() => _FashionModelUIState();
}

class _FashionModelUIState extends State<FashionModelUI> {
  List<FashionModel> fashionData1 = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fashionData1 == null
          ? CircularProgressIndicator()
          : ListView.builder( // generates a list using itemCount and itemBUilder

        itemCount: fashionData1.length,

        itemBuilder: (context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(fashionData1[index].title),
                    Image.network(fashionData1[index].image),
                    Text(fashionData1[index].price.toString())
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
      fashionData1  = fashionDaata;
    });
    print("thsi si dataaaaa ${fashionData1[1].title}");
  }

}
