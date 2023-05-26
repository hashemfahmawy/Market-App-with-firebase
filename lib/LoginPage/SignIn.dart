import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/LoginPage/sign_up.dart';
import 'package:market_app/ViewModel/SignIn/cubit.dart';
import 'package:market_app/ViewModel/SignIn/states.dart';
import 'package:market_app/shopping/controller.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Text(
                  "Welcome \nBack",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ).tr(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(17, 0, 120, 0),
                child: Text(
                  "Enter your email address and your passord for sign in, Enjoy your food :)",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ).tr(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black45, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black45),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enter Your Email".tr(),
                  ),
                  onSubmitted: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black45, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black45),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Enter Your Password".tr(),
                  ),
                  onSubmitted: (value) {
                    //
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account?",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ).tr(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      "Create new account",
                      style: TextStyle(
                        color: Color.fromARGB(255, 7, 117, 64),
                      ),
                    ).tr(),
                  ),
                ],
              ),
              BlocConsumer<SignInCubit, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(
                                  255, 7, 117, 64), // Background color
                            ),
                            onPressed: () {
                              context.read<SignInCubit>().SignIn(
                                    email: controllerEmail.text.trim(),
                                    password: controllerPassword.text.trim(),
                                  );
                            },
                            child: const Text(
                              "signin",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ).tr()),
                      ),
                    );
                  }
                },
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigationExample(),
                        ),
                        (route) => false);
                  } else if (state is SignInError) {
                    //
                    var snackBar = SnackBar(
                      content: Text(
                        state.msgErr!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
