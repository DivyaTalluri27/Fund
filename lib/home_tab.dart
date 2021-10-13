import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mutual_fund/widgets/home_card.dart';
import 'package:mutual_fund/widgets/home_text_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:mutual_fund/widgets/home_slider.dart';

import 'widgets/widgets.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    List<bool> boolList = [true, false];
    int index = 0;

    double _initialRating = 2.0;
    IconData? _selectedIcon;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 30, top: 20, left: 16, bottom: 15),
              child: TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search Fund...',
                  hintStyle: TextStyle(color: Color(0xff9F9F9F), fontSize: 13),
                  // prefixIcon: Icon(Icons.search, color: Colors.deepOrangeAccent,
                  // ),
                  // prefixIcon: Image.asset('assets/icons/Search.png'),
                  // contentPadding: EdgeInsets.all(10),
                  contentPadding: EdgeInsets.only(left: 31),
                  //   left: 25,
                  // ),
                  // contentPadding: new EdgeInsets.fromLTRB(
                  //     10.0, 90.0, 10.0, 50.0),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            HomeText(),
            HomeCard(
                trailing: boolList[index]
                    ? Text("High ",
                        style: TextStyle(
                          color: Colors.deepOrange,
                        ))
                    : Text("Low ",
                        style: TextStyle(
                          color: Colors.green,
                        ))),
            HomeSlider(),
            SizedBox(
              height: 20,
            ),
            HomeButton(),
            HomeCard(
              trailing: RatingBar.builder(
                initialRating: _initialRating,
                minRating: 1,
                // direction: _isVertical ? Axis.vertical : Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Colors.amber.withAlpha(40),
                itemCount: 5,
                itemSize: 15.0,
                itemPadding: EdgeInsets.symmetric(
                  horizontal: 1.0,
                ),
                itemBuilder: (context, _) => Icon(
                  _selectedIcon ?? Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {});
                },
                updateOnDrag: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
