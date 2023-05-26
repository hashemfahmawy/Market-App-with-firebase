import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/LoginPage/SignIn.dart';
import 'package:market_app/LoginPage/onBoarding.dart';
import 'package:market_app/ViewModel/SignUp/cubit.dart';
import 'package:market_app/ViewModel/SignUp/states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controllerEmail = TextEditingController();

  TextEditingController controllerPassword = TextEditingController();

  TextEditingController controllerName = TextEditingController();

  TextEditingController controllerPhone = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerName.dispose();
    controllerPassword.dispose();
    controllerPhone.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: BlocConsumer<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView(
                      children: [
                        SizedBox(
                          height: 70.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Create \nAccount",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ).tr(),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: controllerName,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your Name".tr(),
                            ),
                            onSubmitted: (value) {
                              //
                            },
                          ),
                        ),
                        SizedBox(
                          height: 17.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your Email".tr(),
                            ),
                            onSubmitted: (value) {
                              //
                            },
                          ),
                        ),
                        SizedBox(
                          height: 17.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: controllerPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your Password",
                            ),
                            onSubmitted: (value) {
                              //
                            },
                          ),
                        ),
                        SizedBox(
                          height: 17.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: controllerPhone,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Enter Your Phone Number".tr(),
                            ),
                            onSubmitted: (value) {
                              //
                            },
                          ),
                        ),
                        SizedBox(
                          height: 17.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<SignUpCubit>()
                                  .selectDateTime(context);
                            },
                            child: AbsorbPointer(
                              child: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        "${context.read<SignUpCubit>().selectTime}"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(
                                      255, 7, 117, 64), // Background color
                                ),
                                onPressed: () {
                                  context.read<SignUpCubit>().signUp(
                                        email: controllerEmail.text.trim(),
                                        password:
                                            controllerPassword.text.trim(),
                                        name: controllerName.text,
                                        phone: controllerPhone.text.trim(),
                                      );
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ).tr()),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account?",
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ).tr(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 7, 117, 64),
                                ),
                              ).tr(),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    //

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnboardingPageState()),
                        (route) => false);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
