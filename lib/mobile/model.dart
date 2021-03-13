class Mobile {
  String name;
  String image;
  String price;
  String deliveryDate;

  Mobile({this.name, this.image, this.price, this.deliveryDate});

  Mobile.fromJson(Map<String, dynamic> json) {
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
