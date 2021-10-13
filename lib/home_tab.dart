import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mutual_fund/widgets/home_card.dart';
import 'package:mutual_fund/widgets/home_text_button.dart';
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
                textAlignVertical: TextAlignVertical.center,
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search Fund...',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: TextStyle(color: Color(0xff9F9F9F), fontSize: 13),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 5,
                      left: 10,
                    ),
                    child: Image.asset(
                      'assets/search.png',
                    ),
                  ),
                  // contentPadding: EdgeInsets.only(bottom: 10),
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
            HomeCard(),
            HomeSlider(),
            SizedBox(
              height: 20,
            ),
            HomeButton(),
            HomeCard(),
          ],
        ),
      ),
    );
  }
}
