import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:onlinelearning/MainPage.dart';

import 'components/rounded_button.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InterProg"),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        child: _isLoggedIn
            ? Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(_userObj["picture"]["data"]["url"]),
            Text(_userObj["name"]),
            Text(_userObj["email"]),
            TextButton(
                onPressed: () {
                  // FacebookAuth.instance.logOut().then((value) {
                  //   setState(() {
                  //     _isLoggedIn = false;
                  //     _userObj = {};
                  //   });
                  // });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPage();
                      },
                    ),
                  );
                },
                child: Text(
                    "Continue",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                )
            ),

          ],
        )
            : Center(
          child: RoundedButton(
            text: "Login with Facebook",
            press: () async {
              FacebookAuth.instance.login(
                  permissions: ["public_profile", "email"]).then((value) {
                FacebookAuth.instance.getUserData().then((userData) {
                  setState(() {
                    _isLoggedIn = true;
                    _userObj = userData;
                  });
                });
              });
            },
          ),
        ),
      ),
    );
  }
}