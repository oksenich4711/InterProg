import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
 import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:onlinelearning/MyCoursePage.dart';
import 'package:onlinelearning/SchedulePage.dart';
import 'package:onlinelearning/WelcomePage.dart';

import 'MainPage.dart';
import 'components/profile_list_item.dart';
import 'constants.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profilePage(),
      routes: {
        '/mainPage' : (context)=>MainPage(),
        '/sсhedulePage' : (context)=>SchedulePage(),
        '/myCoursePage' : (context)=>MyCoursePage(),
        '/welcomePage' : (context)=>WelcomePage(),
      },
    );
  }
}

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    final Expanded profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/image/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kLightPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'John Grade',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'john.grade@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 4),
        ],
      ),
    );

    final Row header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        IconButton(
          // onPressed: (){Navigator.pushNamed(context, '/myCoursePage');},
          icon: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        profileInfo,
        // themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    //return ThemeSwitchingArea(
      return Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/myCoursePage'),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.code,
                          text: 'My courses',
                        ),
                      ),
                      // ProfileListItem(
                      //   icon: LineAwesomeIcons.code,
                      //   text: 'My courses',
                      // ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.theater_masks,
                        text: 'Character',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.graduation_cap,
                        text: 'Achievements',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: 'Settings',
                      ),
                      // ProfileListItem(
                      //   icon: LineAwesomeIcons.user_plus,
                      //   text: 'Invite a Friend',
                      // ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/welcomePage'),
                        child: ProfileListItem(
                          icon: LineAwesomeIcons.alternate_sign_out,
                          text: 'Logout',
                          hasNavigation: false,
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: (){Navigator.pushNamed(context, '/mainPage');},
                        icon: Icon(
                          Icons.subscriptions,
                          color: Color(0xff2657ce).withOpacity(0.5),
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: (){Navigator.pushNamed(context, '/sсhedulePage');},
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          color: Color(0xff2657ce).withOpacity(0.5),
                          size: 40,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Color(0xff2657ce),
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    //);
  }
}