import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/ViewModel/OrdersHistoryDet/cubit.dart';
import '../CartSql/cart_details.dart';
import '../ViewModel/OrdersHistoryDet/states.dart';

class OrdersHistoryDetails extends StatefulWidget {
  final String? docId;
  const OrdersHistoryDetails({super.key, this.docId});

  @override
  State<OrdersHistoryDetails> createState() => _OrdersHistoryDetailsState();
}

class _OrdersHistoryDetailsState extends State<OrdersHistoryDetails> {
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersHistoryDetCubit()..getData(widget.docId),
      child: Scaffold(
          body: BlocConsumer<OrdersHistoryDetCubit, OrdersHistoryDetStates>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 100,
                color: Color.fromARGB(255, 7, 117, 64),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Orders Details",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ).tr(),
                  ),
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartHistoryDet(
                      image: context
                          .read<OrdersHistoryDetCubit>()
                          .dataHistory[index]
                          .image,
                      title: context
                          .read<OrdersHistoryDetCubit>()
                          .dataHistory[index]
                          .title,
                      price: context
                          .read<OrdersHistoryDetCubit>()
                          .dataHistory[index]
                          .price,
                      id: context
                          .read<OrdersHistoryDetCubit>()
                          .dataHistory[index]
                          .id,
                    );
                  },
                  itemCount:
                      context.read<OrdersHistoryDetCubit>().dataHistory.length,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Divider(
                        thickness: 2,
                      ),
                    );
                  }),
            ]),
          );
        },
        listener: (context, state) {},
      )),
    );
  }
}
