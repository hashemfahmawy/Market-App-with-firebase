import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Model/home_model.dart';
import 'package:market_app/ViewModel/CartShopping/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInit());
  List<HomeModel> getdata = [];

  //
  void saveData(List? cart) {
    //
    print(cart);
    FirebaseFirestore.instance.collection("Orders").doc().set({
      "cart": cart!.toList(),
    }).then((value) {
      emit(CartSuccess());
    });
  }
}
