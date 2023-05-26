import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:market_app/shopping/accountPage.dart';
import 'package:market_app/shopping/homePage.dart';
import 'package:market_app/shopping/shoppingPage.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  List _pages = [
    HomePage(),
    ShoppingPage(),
    AccountPage(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Color.fromARGB(255, 7, 117, 64),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home".tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Shopping Cart".tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "My Account".tr()),
        ],
      ),
    );
  }
}
