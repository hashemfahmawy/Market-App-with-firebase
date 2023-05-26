import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:market_app/OrderHisory/ordersDet.dart';

class CartHistory extends StatelessWidget {
  final String? id;

  const CartHistory({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print(id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => OrdersHistoryDetails(
                  docId: id,
                ))));
      },
      leading: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqDqJWVjf7Ycbes53fVUAXpjBy05PGqtSsg&usqp=CAU"),
      title: Text("Delivered").tr(),
    );
  }
}
