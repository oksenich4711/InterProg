import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlinelearning/CoursePage.dart';
import 'package:onlinelearning/ProfilePage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


import 'SchedulePage.dart';
import 'components/course.dart';
import 'components/details_screen.dart';
import 'constants.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      routes: {
        '/coursePage' : (context)=>CoursePage(),
        '/profilePage' : (context)=>ProfilePage(),
        '/schedulePage' : (context)=>SchedulePage(),
      },
    );
  }
}
class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  String _sortValue;
  String _ascValue = "ASC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 60,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F7),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: SvgPicture.asset("assets/icons/search.svg"),
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        child: Text(
                          "Search for anything",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFA0A5BD),
                          ),
                        ),
                      ),
                      // SvgPicture.asset("assets/icons/search.svg"),
                      // SizedBox(width: 16),
                      // Text(
                      //   "Search for anything",
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Color(0xFFA0A5BD),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Image.asset("assets/image/user.png"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Courses", style: kHeadingextStyle),
                Text(
                  "Filters",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: courses.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          width: 2.0, color: const Color(0xFF0400B3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            currentCourse = courses[index];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen()));
                          },
                          child: Text(
                            courses[index].name,
                            style: kTitleTextSyule,
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/person.svg"),
                            SizedBox(width: 5),
                            Text(
                                '${(courses[index].numOfPeople / 1000.0).toStringAsFixed(1)}'),
                            SizedBox(width: 15),
                            SvgPicture.asset("assets/icons/star.svg"),
                            SizedBox(width: 5),
                            Text('${courses[index].numOfStars}'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SvgPicture.asset("assets/icons/clock3.svg"),
                            SizedBox(width: 5),
                            Text('${courses[index].numOfHours}'),
                          ],
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(courses[index].image),
                        )
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.subscriptions,
                      color: Color(0xff2657ce),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: (){Navigator.pushNamed(context, '/schedulePage');},
                    icon: Icon(
                      Icons.calendar_today_rounded,
                      color: Color(0xff2657ce).withOpacity(0.5),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: (){Navigator.pushNamed(context, '/profilePage');},
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
      ),
    );
  }

  Future<void> showFilterDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext build) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Center(
                  child: Text(
                    "Filter",
                    style: TextStyle(color: mainColor),
                  )),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 12, right: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.sort,
                              color: Color(0xff808080),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Text("Sort by"),
                                items: <String>[
                                  "Name",
                                  "Age",
                                  "Date",
                                ].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(
                                            color: textColor, fontSize: 16)),
                                  );
                                }).toList(),
                                value: _sortValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _sortValue = newValue;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8, right: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.sort_by_alpha,
                              color: Color(0xff808080),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                items: <String>[
                                  "ASC",
                                  "DESC",
                                ].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(
                                            color: textColor, fontSize: 16)),
                                  );
                                }).toList(),
                                value: _ascValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _ascValue = newValue;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> coursesForSearch;
  var suggestion = ["C++", "Python", "JavaScript"];
  List<String> searchResult = List();

  CustomSearchDelegate() {
    for (int i = 0; i < courses.length; ++i) {
      coursesForSearch.add(courses[i].name);
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();

    searchResult =
        coursesForSearch.where((element) => element.startsWith(query)).toList();
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(suggestion.length, (index) {
            var item = suggestion[index];
            return Card(
              color: Colors.white,
              child: Container(padding: EdgeInsets.all(16), child: Text(item)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    final suggestionList = query.isEmpty
        ? suggestion
        : coursesForSearch
        .where((element) => element.startsWith(query))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: textColor),
                  )
                ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
