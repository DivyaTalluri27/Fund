import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mutual_fund/widgets/home_text_button.dart';

import 'widgets/home_text_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ExploreFunds extends StatefulWidget {
  const ExploreFunds({Key? key}) : super(key: key);

  @override
  _ExploreFundsState createState() => _ExploreFundsState();
}

class _ExploreFundsState extends State<ExploreFunds> {
  List<bool> boolList = [true, false];

  // double _initialRating = 2.0;
  // IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Button(),
          _buildCard(),
        ],
      ),
    );
  }

  _buildCard() {
    String text =
        "ICICI Prudential Value DiscoveryFund\n - DirectPlan - Growth";
    double _initialRating = 2.0;
    IconData? _selectedIcon;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 10),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.only(left: 22, bottom: 20),
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 90,
                        // padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(right: 35),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff000000).withOpacity(1),
                                  ),
                                ),
                              ),
                              trailing: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, top: 30),
                                child: Text(
                                  "Returns 38.27% (1Y)",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              // title: Image.asset(
                              //   'assets/icon1.png',
                              // ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, top: 45),
                              child: ListTile(
                                leading: Image.asset(
                                  'assets/icon1.png',
                                ),
                                title: Text(
                                  "Low Risk",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
