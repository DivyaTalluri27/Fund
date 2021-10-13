import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeCard extends StatefulWidget {
  HomeCard({required ListTile trailing});

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    List<bool> boolList = [true, false];

    // double _initialRating = 2.0;
    // IconData? _selectedIcon;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 110.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Card(
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
                              leading: boolList[index]
                                  ? Image.asset(
                                      'assets/icon1.png',
                                    )
                                  : Image.asset(
                                      'assets/icon2.png',
                                    ),
                              title: Text(
                                'Icici Prudential Value Discovery Fund -\n Direct Plan - Growth',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, top: 45),
                              child: ListTile(
                                leading: Text("Returns 38.27% (1Y)"),
                                // title: Align(
                                //   child: boolList[index]
                                //       ? Image.asset(
                                //           'assets/icon3.png',
                                //           color: Colors.deepOrange,
                                //         )
                                //       : Image.asset(
                                //           'assets/icon3.png',
                                //         ),
                                //   alignment: Alignment(1.3, 0.1),
                                // ),
                                trailing: this.widget,
                                // RatingBar.builder(
                                //   initialRating: _initialRating,
                                //   minRating: 1,
                                //   // direction: _isVertical ? Axis.vertical : Axis.horizontal,
                                //   allowHalfRating: true,
                                //   unratedColor: Colors.amber.withAlpha(40),
                                //   itemCount: 5,
                                //   itemSize: 15.0,
                                //   itemPadding: EdgeInsets.symmetric(
                                //     horizontal: 1.0,
                                //   ),
                                //   itemBuilder: (context, _) => Icon(
                                //     _selectedIcon ?? Icons.star,
                                //     color: Colors.amber,
                                //   ),
                                //   onRatingUpdate: (rating) {
                                //     setState(() {});
                                //   },
                                //   updateOnDrag: true,
                                // ),
                                // boolList[index]
                                //     ? Text("High ",
                                //         style: TextStyle(
                                //           color: Colors.deepOrange,
                                //         ))
                                //     : Text("Low ",
                                //         style: TextStyle(
                                //           color: Colors.green,
                                //         ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
