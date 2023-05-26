class OrdersHistoryDetModel {
  String? title;
  String? price;
  String? image;
  int? id;
  int? status;
  OrdersHistoryDetModel(
      {this.title, this.price, this.image, this.id, this.status});
  OrdersHistoryDetModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    price = json["price"];
    image = json["image"];
    id = json["id"];
    // status = json["status"];
  }
}
