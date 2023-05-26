import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market_app/main.dart';
import 'package:market_app/payment/payment.dart';
import 'package:market_app/shopping/controller.dart';
import 'package:market_app/OrderHisory/ordersHistory.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({
    super.key,
  });

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Map> data = [];
  double totalAmount = 0.0;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      obj.getAll(1).then((value) {
        setState(() {
          data = value;
        });
        for (var element in value) {
          setState(() {
            String numericalPart =
                element["price"]!.replaceAll(RegExp(r'[^0-9]'), '');

            double number = double.parse(numericalPart) / 100;
            totalAmount = (number * element["quantity"]) + totalAmount;
          });
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 7, 117, 64),
            height: 100,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Shopping Cart',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ).tr(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder()),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavigationExample()));
                            },
                            child: Text(
                              "Add More Items",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ).tr()),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder()),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OrdersHistory()));
                            },
                            child: Text(
                              "Orders History",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ).tr()),
                      ],
                    ),
                  ),
                ],
              ),

              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100,
                    height: 100,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: CartProduct(
                            onTap: () {
                              print("object");
                            },
                            productId: data[index]["productId"],
                            title: data[index]["title"].toString(),
                            price: data[index]["price"].toString(),
                            image: data[index]["image"],
                            quantity: data[index]["quantity"],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              //
                              totalAmount = 0;

                              obj
                                  .updateQuantity(
                                      quantity: data[index]["quantity"] - 1,
                                      productId: data[index]["productId"])
                                  .then((value) {
                                obj.getAll(1).then((v) {
                                  setState(() {
                                    data = v;
                                    if (data[index]["quantity"] == 0) {
                                      obj.removeFromCart(
                                          data[index]["productId"]);
                                    }
                                  });
                                  for (var element in v) {
                                    setState(() {
                                      String numericalPart = element["price"]!
                                          .replaceAll(RegExp(r'[^0-9]'), '');

                                      double number =
                                          double.parse(numericalPart) / 100;
                                      totalAmount =
                                          (number * element["quantity"]) +
                                              totalAmount;
                                    });
                                  }
                                });
                              });
                            },
                            icon: Icon(Icons.remove_circle)),
                        Text(
                          "${data[index]["quantity"]}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              totalAmount = 0;
                              print(data[index]["quantity"]);
                              obj
                                  .updateQuantity(
                                      quantity: data[index]["quantity"] + 1,
                                      productId: data[index]["productId"])
                                  .then((value) {
                                obj.getAll(1).then((v) {
                                  setState(() {
                                    data = v;
                                  });
                                  for (var element in v) {
                                    setState(() {
                                      String numericalPart = element["price"]!
                                          .replaceAll(RegExp(r'[^0-9]'), '');

                                      double number =
                                          double.parse(numericalPart) / 100;
                                      totalAmount =
                                          (number * element["quantity"]) +
                                              totalAmount;
                                    });
                                  }
                                });
                              });
                              //
                            },
                            icon: Icon(Icons.add_circle))
                      ],
                    ),
                  );
                },
                itemCount: data.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 2,
                ),
              ),

              //
              SizedBox(
                height: 30,
              ),
              data.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 140,
                        ),
                        Text(
                          "Your Cart Is Empty.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ).tr(),
                      ],
                    )
                  : Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SUBTOTAL",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))
                                      .tr(),
                                  Text("JOD ${totalAmount}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("DELIVERY FEE",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))
                                      .tr(),
                                  Text("JOD 2",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("TOTAL",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))
                                      .tr(),
                                  Text("JOD ${totalAmount + 2}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(
                                      255, 7, 117, 64), // Color(0xFF69A03A),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // obj.deleteData();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Payment(
                                      amount: totalAmount,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Center(
                                  child: Text("Check Out",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold))
                                      .tr(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    ));
  }
}

class CartProduct extends StatefulWidget {
  final String? price;
  final String? title;
  final String? image;
  final String? productId;
  final int? quantity;
  final void Function() onTap;
  const CartProduct({
    super.key,
    this.price,
    this.title,
    this.image,
    required this.onTap,
    this.productId,
    this.quantity,
  });

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            Image.network(
              widget.image!,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.price!,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
