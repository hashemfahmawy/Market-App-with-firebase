import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/ViewModel/CartShopping/states.dart';
import 'package:market_app/main.dart';
import 'package:market_app/payment/loading.dart';

import '../ViewModel/CartShopping/cubit.dart';

class Payment extends StatefulWidget {
  const Payment({super.key, this.amount});
  final double? amount;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<Map> data = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Total Bill",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold))
                          .tr(),
                    ),
                    Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(":  JOD ${widget.amount! + 2}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Pay With",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.bold))
                      .tr(),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 11,
                    ),
                    CheckboxExample(),
                    const SizedBox(
                      width: 17,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Cash",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          )).tr(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CheckboxExample(),
                      const Text("Credit/Debit Cards",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          )).tr(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "ADD NEW CARD",
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 117, 64),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ).tr(),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.credit_card,
                          size: 40,
                        )),
                    Column(
                      children: [
                        const Text("************4356",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            )),
                        const Text("Hashem Fahmawy",
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Save and Pay via cards",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      )).tr(),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: 30,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7W-X2cX1G6-Lg52nJ00VrUu1VdysafgFXtw&usqp=CAU"),
                    ),
                    SizedBox(
                      width: 130,
                      height: 50,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrXIe_l031F46l4o2Z262wFilrx8vcQ3V20A&usqp=CAUU"),
                    ),
                    SizedBox(
                      width: 130,
                      height: 50,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbKe6vmcycM1UIrlFclhEFYpZjDzvRjgwk5g&usqp=CAU"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 17, 0, 10),
                  child: Text(
                    "Wallet Method",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ).tr(),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNYtqKLjP96yVFlWokKLs_JOK0Ss3u1T3VPA&usqp=CAU"),
                    ),
                    const Text("Phone pay").tr(),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxypYHbwQQ-dIMMmQkXri_udlUtCgpoOVuckzns9wcTvoc4aOjXCkC0LRHAno2P9jofXc&usqp=CAU"),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text("Google pay").tr(),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Image.network(
                            "https://img.freepik.com/free-icon/paypal_318-674245.jpg"),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text("pay Pall").tr(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 25,
                ),
                BlocConsumer<CartCubit, CartState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            primary: const Color.fromARGB(255, 7, 117, 64),
                          ),
                          onPressed: () {
                            obj.getAll(1).then((value) {
                              context
                                  .read<CartCubit>()
                                  .saveData(value.toList());
                              //       //
                              log(value.toString());
                            });
                          },
                          child: const Text(
                            "Place Order",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                          ).tr(),
                        ),
                      ),
                    );
                  },
                  listener: (context, state) {
                    if (state is CartSuccess) {
                      obj.deleteData();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoadingPayment(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 7, 117, 64);
      }
      return const Color.fromARGB(255, 7, 117, 64);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
