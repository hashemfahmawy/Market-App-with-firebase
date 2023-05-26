import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:market_app/LoginPage/SignIn.dart';
import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shopping/controller.dart';

class OnboardingPageState extends StatefulWidget {
  const OnboardingPageState({super.key});

  @override
  State<OnboardingPageState> createState() => _OnboardingPageStateState();
}

class _OnboardingPageStateState extends State<OnboardingPageState> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(bottom: 80.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Container(
              color: Colors.white,
              //child: Text("page1"),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            return controller.jumpToPage(2);
                          },
                          child: Text(
                            "skip",
                            style: TextStyle(color: Colors.grey),
                          ).tr(),
                        )),
                    SizedBox(
                      height: 60.0,
                    ),
                    Image.asset("assets/onB1.jpg"),
                    SizedBox(
                      height: 40.0,
                    ),
                    Title(
                        color: Colors.black,
                        child: Text("healthy recipes",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)
                            .tr()),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "loosing or gaining",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ).tr(),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              //child: Text("page1"),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            return controller.jumpToPage(2);
                          },
                          child: Text(
                            "skip",
                            style: TextStyle(color: Colors.grey),
                          ).tr()),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Image.asset("assets/OnB2.jpg"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Title(
                        color: Colors.black,
                        child: Text("exact nutrition",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)
                            .tr()),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("update our food",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                letterSpacing: 1.5),
                            textAlign: TextAlign.center)
                        .tr(),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              //child: Text("page1"),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                    ),
                    Image.asset("assets/OnB3.jpg"),
                    SizedBox(
                      height: 35.0,
                    ),
                    Title(
                        color: Colors.black,
                        child: Text("daily calorie targets",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)
                            .tr()),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("target weight",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                letterSpacing: 1.5),
                            textAlign: TextAlign.center)
                        .tr(),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          primary: Colors.white,
                          backgroundColor: Color.fromARGB(255, 7, 117, 64),
                          minimumSize: Size(160, 50)),
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationExample(),
                          ),
                        );
                      },
                      child: Text("start").tr()),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 80,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 7, 117, 64),
                        minimumSize: Size(160, 50)),
                    onPressed: () => controller.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                    child: Text("next").tr()),
              ),
            ),
    );
  }
}
