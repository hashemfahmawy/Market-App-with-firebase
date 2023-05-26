import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:market_app/main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HomeDetails extends StatefulWidget {
  final String? productId;
  final String? image;
  final String? price;
  final String? title;
  final String? description;

  const HomeDetails(
      {super.key,
      this.image,
      this.price,
      this.title,
      this.productId,
      this.description});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  TextEditingController controllerPrice = TextEditingController();

  TextEditingController controllerImage = TextEditingController();

  TextEditingController controllerTitle = TextEditingController();

  @override
  void dispose() {
    controllerPrice.dispose();
    controllerTitle.dispose();
    controllerImage.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 80,
            color: Color.fromARGB(255, 7, 117, 64),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      size: 15,
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ).tr(),
                  // Spacer(),
                ],
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(widget.image!),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ).tr(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    widget.description!,
                    style: TextStyle(fontSize: 17, color: Colors.black45),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 29, 0, 0),
                    child: Text(
                      widget.price!,
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 29, 15, 0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            primary: Colors.white,
                            backgroundColor: Color.fromARGB(255, 7, 117, 64),
                            minimumSize: Size(160, 50)),
                        onPressed: () async {
                          //

                          final databasePath = await getDatabasesPath();
                          final database =
                              await openDatabase(join(databasePath, 'cart.db'));
                          final results = await database.query(
                            'Cart',
                            where: 'productId = ?',
                            whereArgs: [widget.productId],
                          );
                          final exists = results.isNotEmpty;

                          if (exists) {
                            print("exists  ${widget.productId}");

                            final snackBar = SnackBar(
                              content: Text("Already Added"),
                              backgroundColor: Color.fromARGB(246, 178, 42, 0),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            print("Not exists  ${widget.productId}");
                            obj.insertToDatabase(
                                title: widget.title,
                                price: widget.price,
                                image: widget.image,
                                productId: widget.productId,
                                status: 1);

                            log("inserted");
                          }
                        }, //
                        child: Text("Add To Cart").tr()),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
