import 'package:flutter/material.dart';
import 'package:onlinelearning/MainPage.dart';
import 'package:onlinelearning/ProfilePage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'components/new_task.dart';
import 'constants.dart';


class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: schedulePage(),
      theme: ThemeData(
          fontFamily: 'Nutino'
      ),
      routes: {
        // '/mainPage' : (context)=>MainPage(),
        // '/signUpPage' : (context)=>SignUpPage(),
      },
    );
  }
}
class schedulePage extends StatefulWidget {
  @override
  _schedulePageState createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  String taskPop  = "close";
  var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEPT", "OCT", "NOV", "DEC"];
  CalendarController ctrlr = new CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: kLightBlueColor,
                elevation: 0,
                title: Text("Work List", style: TextStyle(
                    fontSize: 30
                ),),
              ),
              Container(
                height: 70,
                color: kLightBlueColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){changeFilter("today");},
                          child: Text("Today", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType== "today")?Colors.white:Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){changeFilter("monthly");},
                          child: Text("Monthly", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == "monthly")?Colors.white:Colors.transparent,
                        )
                      ],
                    )
                  ],
                ),
              ),
              (filterType == "monthly")?TableCalendar(
                calendarController: ctrlr,
                startingDayOfWeek: StartingDayOfWeek.monday,
                initialCalendarFormat: CalendarFormat.week,
              ):Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today ${monthNames[today.month-1]}, ${today.day}/${today.year}", style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                            ), )
                          ],
                        ),
                      ),
                      taskWidget(kBlueColor, "Animation Course" , "9:00 AM"),
                      taskWidget(kBlueColor, "Python for everybody" , "9:15 AM"),
                      taskWidget(kBlueColor, "Animation Course" , "6:30 PM"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 60,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: openNewTask,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [kRedColor, Colors.red],
                              ),
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Text("+", style: TextStyle(
                                fontSize: 40,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 85, 10, 10),
                      // EdgeInsets.all(80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: (){openMainPage();},
                            icon: Icon(
                              Icons.subscriptions,
                              color: Color(0xff2657ce).withOpacity(0.5),
                              size: 40,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xff2657ce),
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: (){openProfilePage();},
                            icon: Icon(
                              Icons.account_circle,
                              color: Color(0xff2657ce).withOpacity(0.5),
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  changeFilter(String filter)
  {
    filterType = filter;
    setState(() {

    });
  }

  Slidable taskWidget(Color color, String title, String time)
  {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.03),
                offset: Offset(0,9),
                blurRadius: 20,
                spreadRadius: 1
            )]
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color,
                      width: 4)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                ),),
                Text(time, style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                ),)
              ],
            ),
            Expanded(child: Container(),),
            Container(
              height: 50,
              width: 5,
              color: color,
            )
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: Colors.white,
          icon: Icons.edit,
          onTap: (){},
        ),
        IconSlideAction(
          caption: "Delete",
          color: color,
          icon: Icons.edit,
          onTap: (){},
        )
      ],
    );
  }
  openNewTask()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewTask()));
  }

  openMainPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
  }

  openProfilePage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
  }
}

