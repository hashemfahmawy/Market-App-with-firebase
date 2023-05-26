import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_app/ViewModel/OrdersHistory/states.dart';

import '../../Model/orders_his.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryStates> {
  OrdersHistoryCubit() : super(OrdersHistoryInitState());
  List<String> dataHistory = [];

  void getData() {
    //
    emit(OrdersHistoryLoadingState());

    FirebaseFirestore.instance.collection("Orders").get().then((value) {
      for (var element in value.docs) {
        dataHistory.add(element.id);
        print(value.docs[0].id);
      }
      emit(OrdersHistorySuccessState());
    });
  }
}
