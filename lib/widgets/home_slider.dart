import 'package:flutter/material.dart';
import 'package:mutual_fund/palatte.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  List<bool> boolList = [true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      //top-size: space between widgets
      margin: const EdgeInsets.only(
        top: 10,
      ),
      height: 115.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color:
                      boolList[index] ? Color(0xff2A5BA0) : Color(0xff069F0D),
                  //Size betwwen 2 cards
                  margin: EdgeInsets.only(left: 18, right: 3),
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 340,
                        height: 89,
                        margin: EdgeInsets.only(left: 0, bottom: 2, right: 0),
                        // padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: boolList[index]
                                ? AssetImage("assets/image.png")
                                : AssetImage("assets/slider.png"),
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 120,
                            top: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(89),
                                bottomRight: Radius.circular(89)),
                            color: Color(0xffFFFFFF).withOpacity(0.36),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, left: 15),
                                child: Row(
                                  children: [
                                    boolList[index]
                                        ? Text(
                                            'Custom Built',
                                            style: eheading,
                                          )
                                        : Text(
                                            'Order History',
                                            style: eheading,
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy eirmod ',
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xffCBCBCB)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, top: 5),
                        child: Text(
                          'Check Now ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffCBCBCB),
                              fontWeight: FontWeight.bold),
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
