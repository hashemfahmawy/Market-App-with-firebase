import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/CartSql/cart_history.dart';
import '../ViewModel/OrdersHistory/cubit.dart';
import '../ViewModel/OrdersHistory/states.dart';
import '../main.dart';

class OrdersHistory extends StatefulWidget {
  const OrdersHistory({super.key});

  @override
  State<OrdersHistory> createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  List<Map> data = [];
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      obj.getAll(2).then((value) {
        setState(() {
          data = value;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersHistoryCubit()..getData(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: BlocConsumer<OrdersHistoryCubit, OrdersHistoryStates>(
          builder: (context, state) {
            if (state is OrdersHistoryLoadingState) {
              return const SafeArea(
                  child: Center(child: CircularProgressIndicator()));
            } else {
              return Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 7, 117, 64),
                    height: 100,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              "Orders History",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ).tr(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartHistory(
                            id: context
                                .read<OrdersHistoryCubit>()
                                .dataHistory[index]);
                      },
                      itemCount:
                          context.read<OrdersHistoryCubit>().dataHistory.length,
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 13),
                          child: Divider(
                            thickness: 2,
                          ),
                        );
                      }),

                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              );
            }
          },
          listener: (context, state) {},
        ),
      )),
    );
  }
}
