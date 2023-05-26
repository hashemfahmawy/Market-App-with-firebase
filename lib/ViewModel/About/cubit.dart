import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_app/Model/about_model.dart';
import 'package:market_app/ViewModel/About/states.dart';

class AboutCubit extends Cubit<AboutStates> {
  AboutCubit() : super(AboutInitState());
  List<AboutModel> datadesc = [];

  void getData() {
    //
    emit(AboutLoadingState());
    FirebaseFirestore.instance.collection("about").get().then((value) {
      for (var element in value.docs) {
        datadesc.add(AboutModel.fromJson(element.data()));
      }
      emit(AboutSuccessState());
    });
  }
}
