import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_app/ViewModel/SignIn/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInit());

  Future<void> SignIn({String? email, String? password}) async {
    //
    final SharedPreferences pre = await SharedPreferences.getInstance();
    //
    emit(SignInLoading());
    //
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      pre.setString("id", value.user!.uid.toString());
      emit(SignInSuccess(msg: value.user!.email.toString()));
      log(value.user!.email.toString());
    }).catchError((onError) {
      emit(SignInError(msgErr: onError.toString()));
      log(onError.toString());
    });
  }
}
