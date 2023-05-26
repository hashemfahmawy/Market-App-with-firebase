import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/ViewModel/SignUp/states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInit());
  DateTime selectTime = DateTime.now();
  String? Name;

  void signUp(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? date}) {
    //
    Name = name;
    emit(SignUpLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      saveData(name, email, value.user!.uid.toString(), phone, date);
    }).catchError((onError) {
      emit(SignUpError());
    });
  }

  void saveData(
      String? name, String? email, String? uid, String? phone, String? date) {
    FirebaseFirestore.instance.collection("Users").doc(uid).set({
      "name": name,
      "email": email,
      "phone": phone,
      "date": selectTime,
      "uid": uid,
    }).then((value) {
      emit(SignUpSuccess());
    }).catchError((onError) {
      emit(SignUpError(msgErr: onError.toString()));
      log(onError.toString());
    });
  }

  Future<void> selectDateTime(BuildContext context) async {
    //
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: selectTime,
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );

    if (picker != null) {
      selectTime = picker;
    }

    emit(SignUpPickDateState());
  }
}
