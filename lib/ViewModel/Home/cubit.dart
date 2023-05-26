import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_app/Model/home_model.dart';
import 'package:market_app/ViewModel/Home/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  List<HomeModel> data0 = [];
  List<HomeModel> data1 = [];

  void getData() {
    //
    emit(HomeLoadingState());

    FirebaseFirestore.instance
        .collection("Organic Protein")
        .get()
        .then((value) {
      for (var element in value.docs) {
        data0.add(HomeModel.fromJson(element.data()));
      }
      FirebaseFirestore.instance.collection("Meals").get().then((v) {
        for (var element in v.docs) {
          data1.add(HomeModel.fromJson(element.data()));
        }
        emit(HomeSuccessState());
      });
    });
  }
}
