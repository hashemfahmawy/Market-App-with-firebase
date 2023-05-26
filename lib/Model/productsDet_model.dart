class ProductsDetModel {
  String? title;
  String? description;
  String? price;
  String? image;
  ProductsDetModel({
    this.title,
    this.description,
    this.price,
    this.image,
  });
  ProductsDetModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    price = json["price"];
    image = json["image"];
  }
}
