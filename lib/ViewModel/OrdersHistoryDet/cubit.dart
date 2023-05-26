import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_app/Model/orders_history_model.dart';
import 'package:market_app/ViewModel/OrdersHistoryDet/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersHistoryDetCubit extends Cubit<OrdersHistoryDetStates> {
  OrdersHistoryDetCubit() : super(OrdersHistoryDetInitState());
  List<OrdersHistoryDetModel> dataHistory = [];
  void getData(String? docId) {
    //
    emit(OrdersHistoryLoadingDetState());

    FirebaseFirestore.instance
        .collection("Orders")
        .doc(docId)
        .get()
        .then((value) {
      for (var element in value["cart"]) {
        dataHistory.add(OrdersHistoryDetModel.fromJson(element));
        print(value["cart"].toString());
      }

      emit(OrdersHistorySuccessDetState());
    });
  }
}
