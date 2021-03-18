import 'package:flipkartapp/electronic/next_page.dart';
import 'package:flutter/material.dart';

import '../services/service.dart';
import 'model.dart';

class ElectronicsPage extends StatefulWidget {
  @override
  _ElectronicsPageState createState() => _ElectronicsPageState();
}

class _ElectronicsPageState extends State<ElectronicsPage> {
  List<ElectronicModel> Electronic22;

  @override
  void initState() {
    super.initState();
    getElectronicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Electronic22 == null
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: Electronic22.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextPage()),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Electronic22[index].name),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Text("RS." + Electronic22[index].price),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              child: Image.network(
                                Electronic22[index].image,
                                height: 50,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }

  getElectronicData() async {
    List<ElectronicModel> ElectronicData;
    Service services = Service();
    ElectronicData = await services.getElectronics();
    setState(() {
      Electronic22 = ElectronicData;
    });
  }
}
