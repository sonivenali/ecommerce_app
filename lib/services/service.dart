import 'dart:convert';

import 'package:flipkartapp/fashion/model.dart';
import 'package:flipkartapp/mobile/model.dart';
import 'package:http/http.dart' as http;

import '../electronic/model.dart';

class Service {
  String url = "https://fakestoreapi.com"; //online api

  getFashionListModel() async {
    final response = await http.get('$url/products');
    final data = json.decode(response.body);
    List<FashionModel> items = [];
    for (Map<String, dynamic> u in data) {
      items.add(FashionModel.fromJson(u));
    }
    return items;
  }

  getElectronics() async {
    final response = await http.get(
        'https://api.mocki.io/v1/3dfa51b7'); //aditya api
    final data = json.decode(response.body);
    List<ElectronicModel> items = [];
    for (Map<String, dynamic> u in data) {
      items.add(ElectronicModel.fromJson(u));
    }
    return items;
  }

  getMobile() async {
    final response = await http.get(
      'https://run.mocky.io/v3/b800b603-1575-4f9e-a0f1-c7ae6fab8fa2', //aditya api
    );
    final data = json.decode(response.body);
    List<MobileModel> items = [];
    for (Map<String, dynamic> u in data) {
      items.add(MobileModel.fromJson(u));
    }
    return items;
  }


  registervenali(reqbody) async {
    //aditya registration
    print("inside login for reqbody $reqbody");
    final response = await http.post(
      'https://pbh-app.herokuapp.com/api/jwtauth/register/',
      body: reqbody,
//    headers: {"Content-Type": "application/form-data"},
    );
    final data = json.decode(response.body);
    print(data);
    return data;
  }


  loginApi(reqbody) async {
    // di api
    print("inside login for reqbody $reqbody");
    final response = await http.post(
      'https://pbh-app.herokuapp.com/api/token/',
      body: reqbody,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = json.decode(response.body);

    return data;
  }


}