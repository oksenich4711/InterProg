import 'package:course_app/constants.dart';
import 'package:course_app/model/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Course currentCourse;

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage(currentCourse.image),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset("assets/icons/arrow-left.svg",
                          color: currentCourse.colorOfText),),
                      // SvgPicture.asset("assets/icons/arrow-left.svg",
                      //     color: currentCourse.colorOfText),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(currentCourse.name,
                      style: kHeadingextStyle.copyWith(
                          color: currentCourse.colorOfText)),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/person.svg",
                          color: currentCourse.colorOfText),
                      SizedBox(width: 5),
                      Text(
                        '${(currentCourse.numOfPeople / 1000.0).toStringAsFixed(1)}',
                        style: kSubtitleTextSyule.copyWith(
                            color: currentCourse.colorOfText),
                      ),
                      SizedBox(width: 15),
                      SvgPicture.asset("assets/icons/star.svg",
                          color: currentCourse.colorOfText),
                      SizedBox(width: 5),
                      Text(
                        '${currentCourse.numOfStars}',
                        style: kSubtitleTextSyule.copyWith(
                            color: currentCourse.colorOfText),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/clock3.svg",
                          color: currentCourse.colorOfText),
                      SizedBox(width: 5),
                      Text(
                        '${currentCourse.numOfHours}',
                        style: kSubtitleTextSyule.copyWith(
                            color: currentCourse.colorOfText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: new SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5),
                          Text("Description", style: kTitleTextStyle),
                          SizedBox(height: 5),
                          RichText(
                              text: TextSpan(
                                text: currentCourse.description,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                                // children: <TextSpan>[
                                //   TextSpan(text: " from ", style: TextStyle(color: Colors.red)),
                                //   TextSpan(text: "Metanit.com", style: TextStyle(fontWeight: FontWeight.bold)),
                                // ],
                              ),
                          ),
                          SizedBox(height: 30),
                          Text("Course Content", style: kTitleTextStyle),
                          SizedBox(height: 25),
                          CourseContent(
                            number: "01",
                            duration: 3,
                            title: "Welcome to the Course",
                            //isDone: true,
                          ),
                          CourseContent(
                            number: '02',
                            duration: 20,
                            title: "Intro",
                            //isDone: true,
                          ),
                          CourseContent(
                            number: '03',
                            duration: 15,
                            title: "First theme",
                          ),
                          CourseContent(
                            number: '04',
                            duration: 5,
                            title: "Customer Perspective",
                          ),
                          SizedBox(height: 70),
                        ],
                      ),
                    ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kBlueColor,
                                ),
                                child: TextButton(
                                  //onPressed: ,
                                  child: Text(
                                    "Join",
                                    style: kSubtitleTextSyule.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final int duration;
  final String title;
  final bool isDone;

  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kLightBlueColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
