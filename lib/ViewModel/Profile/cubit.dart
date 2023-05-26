import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_app/ViewModel/Profile/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  XFile? image;
  bool? isPick = false;

  void getUserInfo() {
    //
  }
  Future<void> imagePick() async {
    final ImagePicker picker = ImagePicker();

    image = await picker.pickImage(source: ImageSource.camera);
    isPick = true;
    emit(ProfileUpdateImageState());
  }

  Future<void> uploadImage({String? phone, String? name, String? date}) async {
    //

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(image!.path.toString());

    if (image != null) {
      FirebaseStorage.instance
          .ref()
          .child("images/${Uri.file(image!.path).pathSegments.last}")
          .putFile(File(image!.path))
          .then((p0) {
        p0.ref.getDownloadURL().then((value) {
          print(value);

          FirebaseFirestore.instance
              .collection("Users")
              .doc(prefs.getString("id"))
              .update({
            //
            "name": name,
            "date": date,
            "phone": phone,
            "image": value,
          }).then((v) {
            //

            getUserInfo();
          }).catchError((onError) {
            //
          });
        });
      });
    } else {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(prefs.getString("id"))
          .update({
        "Name": name,
        "date": date,
        "phone": phone,
      }).then((value) {
        getUserInfo();
      }).catchError((onError) {});
    }
  }
}
