import 'package:flutter/material.dart';

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
