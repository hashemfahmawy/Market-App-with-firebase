import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_app/LoginPage/SignIn.dart';
import 'package:market_app/myAccount/about.dart';
import 'package:market_app/myAccount/editProfile.dart';
import 'package:market_app/shopping/controller.dart';
import 'onBoarding.dart';

class welcomePic extends StatefulWidget {
  const welcomePic({super.key});

  @override
  State<welcomePic> createState() => _welcomePicState();
}

class _welcomePicState extends State<welcomePic> {
  @override
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginPage()), //BottomNavigationExample()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 7, 117, 64),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 7, 117, 64),
              statusBarBrightness: Brightness.light),
        ),
      ),
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 5)),
        builder: (ctx, timer) => timer.connectionState == ConnectionState.done
            ? LoginPage() //BottomNavigationExample() //Screen to navigate to once the splashScreen is done.
            : Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    children: [
                      Spacer(),
                      Image.asset("assets/logo.jpg"),
                      const Text("HealthyFood",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontFamily: "Great Vibes",
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
