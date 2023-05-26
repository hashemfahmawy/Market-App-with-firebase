class HomeModel {
  String? title;
  String? price;
  String? image;
  String? description;
  String? id;
  HomeModel({this.title, this.price, this.image, this.description, this.id});
  HomeModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    price = json["price"];
    image = json["image"];
    description = json["description"];
    id = json["id"];
  }
}
