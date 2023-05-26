import 'package:flutter/material.dart';
import 'package:market_app/OrderHisory/ordersDet.dart';

class CartHistoryDet extends StatelessWidget {
  final int? id;
  final String? title;
  final String? image;
  final String? price;
  // final int? status;

  const CartHistoryDet(
      {super.key, this.id, this.image, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image!),
      title: Text(title!),
      subtitle: Text(price!),
    );
  }
}
