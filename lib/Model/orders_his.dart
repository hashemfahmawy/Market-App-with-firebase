class OrdersHistoryModel {
  String? docId;

  OrdersHistoryModel({this.docId});
  OrdersHistoryModel.fromJson(Map<String, dynamic> json) {
    docId = json["id"];
  }
}
