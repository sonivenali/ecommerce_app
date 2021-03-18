
import 'package:flipkartapp/fashion/model.dart';
import 'package:flipkartapp/services/service.dart';
import 'package:flutter/material.dart';



class FashionPage extends StatefulWidget {
  @override
  _FashionPageState createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
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
          ? Center(child: CircularProgressIndicator())
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
    Service services = Service();
    fashionDaata = await services.getFashionListModel();
    setState(() {
      fashionData1  = fashionDaata;
    });
    print("thsi si dataaaaa ${fashionData1[1].title}");
  }

}
