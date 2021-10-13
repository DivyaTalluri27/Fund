import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mutual_fund/explore_funds.dart';
import 'package:mutual_fund/palatte.dart';

import 'explore_funds.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xff0D4593),
                  ),
                  onPressed: () {},
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    color: Color(0xff0D4593),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Color(0xff0D4593),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 20.4 / 2)
                ],
                // title: Text(MyApp.title),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'All Funds',
                        style: TextStyle(
                            color: _selectedIndex == value
                                ? kTextColor
                                : kTextLightColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Top Rated',
                        style: TextStyle(
                            color: _selectedIndex == value
                                ? kTextColor
                                : kTextLightColor),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Custom Built',
                        style: TextStyle(
                            color: _selectedIndex == value
                                ? kTextColor
                                : kTextLightColor),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ExploreFunds(),
              ExploreFunds(),
              buildImages(),
            ],
          ),
        ),
      ),
    );
  }

  buildImages() {
    return Container(
      child: Text("abc"),
    );
  }
}
