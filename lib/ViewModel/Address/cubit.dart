import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/ViewModel/Address/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(AddressInitState());
  String? Address;
  void getUserInfo() {
    //
  }

  Future<void> uploadAddress({
    String? address,
  }) async {
    //
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(address!.toString());

    FirebaseFirestore.instance
        .collection("Users")
        .doc(prefs.getString("id"))
        .collection("Address")
        .add({"address": address}).then((v) {
      //

      getUserInfo();
    }).catchError((onError) {
      //
    });
  }
}
