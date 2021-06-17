import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:onlinelearning/MainPage.dart';
import 'package:onlinelearning/MyCoursePage.dart';

import 'components/question_controller.dart';
import 'constants.dart';


class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: [
                      Spacer(flex: 3),
                      Text(
                        "Your score:",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(color: Colors.black),
                      ),
                      // Spacer(),
                      Text(
                        "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.black),
                      ),
                      Spacer(flex: 3),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute (
                            builder: (BuildContext context) => MyCoursePage(),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                          decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            "OK",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }
}
