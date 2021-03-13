class MobileModel {
  String name;
  String image;
  String price;
  String deliveryDate;

  MobileModel({this.name, this.image, this.price, this.deliveryDate});

  MobileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    deliveryDate = json['delivery_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['delivery_date'] = this.deliveryDate;
    return data;
  }
}
