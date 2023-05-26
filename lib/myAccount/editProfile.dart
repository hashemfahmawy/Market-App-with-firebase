import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/ViewModel/Profile/cubit.dart';
import 'package:market_app/ViewModel/Profile/states.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMobile = TextEditingController();

  @override
  void dispose() {
    controllerDate.dispose();
    controllerMobile.dispose();
    controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserInfo(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 7, 117, 64),
        ),
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            return ListView(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        child: !context.read<ProfileCubit>().isPick!
                            ? CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR3wNmH0hJFLViPG1uErmFe5sdnW_hqkYBTQ&usqp=CAU",
                                ),
                              )
                            : CircleAvatar(
                                radius: 70,
                                backgroundImage: FileImage(File(
                                    context.read<ProfileCubit>().image!.path)),
                              ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: IconButton(
                            onPressed: () {
                              // Open the Camera
                              context.read<ProfileCubit>().imagePick();
                            },
                            icon: const Icon(
                              Icons.photo_camera_rounded,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name".tr(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: TextField(
                    controller: controllerMobile,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Mobile".tr()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: TextField(
                    controller: controllerDate,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Date".tr()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color.fromARGB(255, 7, 117, 64), // Background color
                      ),
                      onPressed: () {
                        // Call API / Firebase
                        context.read<ProfileCubit>().uploadImage(
                              name: controllerName.text,
                              phone: controllerMobile.text.trim(),
                              date: controllerDate.text,
                            );
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ).tr(),
                    ),
                  ),
                )
              ],
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
