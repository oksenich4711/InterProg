import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlinelearning/LoginPage.dart';

import 'FacebookLogin.dart';
import 'MainPage.dart';
import 'components/already_have_an_account_acheck.dart';
import 'components/or_divider.dart';
import 'components/rounded_button.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_password_field.dart';
import 'components/social_icon.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signUpPage(),
      routes: {
        '/mainPage' : (context)=>MainPage(),
        '/loginPage' : (context)=>LoginPage(),
      },
    );
  }
}
class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                Navigator.pushNamed(context, '/mainPage');
              },
              // press: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return ProfileScreen();
              //       },
              //     ),
              //   );
              // },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushNamed(context, '/loginPage');
              },
              // press: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return LoginScreen();
              //       },
              //     ),
              //   );
              // },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  // press: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return ProfileScreen();
                  //       },
                  //     ),
                  //   );
                  // },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
