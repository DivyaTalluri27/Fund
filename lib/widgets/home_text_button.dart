import 'package:flutter/material.dart';

//Home tab first Text and Button
class HomeText extends StatefulWidget {
  const HomeText({Key? key}) : super(key: key);

  @override
  _HomeTextState createState() => _HomeTextState();
}

class _HomeTextState extends State<HomeText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Text(
              'Custom Built',
              style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            // SizedBox(
            //   width: 200,
            // ),
            Container(
              height: 20,
              margin: EdgeInsets.only(left: 210),
              child: ElevatedButton(
                child: Text('Edit'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff569BEC))),
                onPressed: () {
                  print('Pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Home tab second Text and Button
class HomeButton extends StatefulWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Text(
              'Top Related Funds',
              style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Container(
              height: 20,
              margin: EdgeInsets.only(left: 150),
              child: ElevatedButton(
                child: Text('View more'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff569BEC))),
                onPressed: () {
                  print('Pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Explore tab Text and button widget
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 15),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 110,
            child: ElevatedButton(
              child: Text(
                'RETURN 3Y',
                style: TextStyle(
                  color: Color(0xff44B749).withOpacity(1),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffC3F6C5).withOpacity(0.40))),
              onPressed: () {
                print('Pressed');
              },
            ),
          ),
          Container(
            width: 110,
            height: 20,
            margin: EdgeInsets.only(left: 130),
            child: ElevatedButton(
              child: Text(
                'FILTER',
                style: TextStyle(
                  color: Color(0xff569BEC).withOpacity(1),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffE0E1FA).withOpacity(1))),
              onPressed: () {
                print('Pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}
