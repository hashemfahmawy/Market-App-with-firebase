import 'package:flutter/material.dart';
import 'package:market_app/shopping/controller.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)),
          builder: (ctx, timer) => timer.connectionState == ConnectionState.done
              ? BottomNavigationExample()
              : Scaffold(
                  body: SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 70, 70, 0),
                        child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/7595/7595571.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text(
                          "Payment Suucessful\nYour Order is Bocked",
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
                ),
        ));
  }
}
