import 'package:flutter/material.dart';
import 'package:market_app/payment/done.dart';

class LoadingPayment extends StatelessWidget {
  const LoadingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)),
          builder: (ctx, timer) => timer.connectionState == ConnectionState.done
              ? PaymentDone() //Screen to navigate to once the splashScreen is done.
              : Scaffold(
                  body: SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Image.network(
                            "https://yjchousing.apcfss.in/images/ajax-loader.gif"),
                      ),
                      Text(
                        "Please Wait",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ],
                  )),
                ),
        ));
  }
}
