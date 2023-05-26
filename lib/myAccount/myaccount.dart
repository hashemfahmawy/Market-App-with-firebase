import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_app/LoginPage/SignIn.dart';
import 'package:market_app/myAccount/about.dart';
import 'package:market_app/myAccount/changeAddress.dart';
import 'package:market_app/myAccount/editProfile.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 7, 117, 64),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfile(),
                  ));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us".tr()),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ));
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.location_pin,
                //color: Color(0xFF69A03A),
              ),
              title: Text("Change Address").tr(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeAddress(),
                ));
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                //  color: Color(0xFF69A03A),
              ),
              title: Text("Change Language").tr(),
              onTap: () => showLanguageDialog(context),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out").tr(),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              },
            ),
          ],
        )));
  }
}

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Select Language'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('English'),
              onTap: () {
                EasyLocalization.of(context)!.setLocale(Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('العربية'),
              onTap: () {
                EasyLocalization.of(context)!.setLocale(Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
