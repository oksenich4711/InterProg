import 'package:flutter/material.dart';
import 'QuizPage.dart';
import 'constants.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: testPage(),
      routes: {
        '/quizPage' : (context)=>QuizPage(),
        // '/signUpPage' : (context)=>SignUpPage(),
      },
    );
  }
}

class testPage extends StatefulWidget {
  @override
  _testPageState createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Text(
                    "InterProg",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Color(0xFF4800ff), fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 2), //2/6
                  Text(
                    "Python for everybody. Introduction test",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Let's get it started!",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.deepPurple, fontWeight: FontWeight.normal),
                  ),
                  Spacer(), // 1/6
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Color(0xFF1C2341),
                  //     hintText: "Full Name",
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     ),
                  //   ),
                  // ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/quizPage'),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Continue...",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}