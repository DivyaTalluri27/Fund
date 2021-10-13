import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mutual_fund/palatte.dart';

import 'helpers/constants.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with SingleTickerProviderStateMixin {
  bool expanded = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 100),
    );
  }

  static List<String> monthlyList = UserConstantValues.monthly;
  String _dropdownMonthly = monthlyList[0];

  static List<String> riskList = UserConstantValues.risk;
  String _dropdownRisk = riskList[0];

  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(
    String assetName, [
    double width = 245,
  ]) {
    return Image.asset(
      'assets/$assetName',
      width: width,
      height: 222,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _width = 50;
    final double _height = 50;
    final Color _color = Color(0xff0D4593);
    final BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 18.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      showNextButton: false,
      showDoneButton: false,
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Container(
          margin: EdgeInsets.only(top: 60, left: 333),
          child: Text(
            'SKIP',
            style: TextStyle(fontSize: 16, color: Color(0xFF000000)),
          )),
      globalFooter: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
        ),
        duration: const Duration(seconds: 10),
        child: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.arrow_menu,
              color: Colors.white,
              progress: controller,
              // semanticLabel: 'Show menu',
            ),
            onPressed: () {
              // setState(() {
              //   expanded ? controller.forward() : controller.reverse();
              //   expanded = !expanded;
              // });
            }),
      ),

      pages: [
        PageViewModel(
          titleWidget: _buildTitle(),
          bodyWidget: _buildInvest(),
          image: _buildImage('img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: _buildTitle(),
          bodyWidget: _buildTax(),
          image: _buildImage('img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: _buildTitle(),
          bodyWidget: _buildRisk(),
          image: _buildImage('img3.png'),
          decoration: pageDecoration,
        ),
      ],

      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(10),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xff0D4593),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.only(right: 70, top: 15),
      child: Text(
        'Customize For Your Own Investment',
        style: dheading,
      ),
    );
  }

  Widget _buildTax() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 165),
          child: Text(
            'TAX paying individual ?',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Yes',
                  style: fheading,
                )),
            TextButton(onPressed: () {}, child: Text('No', style: fheading)),
          ],
        )
      ],
    );
  }

  Widget _buildInvest() {
    // bool pressGeoON = false;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 50, top: 10),
          child: Text(
            'How many years planning to invest?',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  '1 Year',
                  style: fheading,
                )),
            TextButton(
                child: Text("3 Year"),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff0D4593)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ))),
                onPressed: () {
                  setState(() {});
                }),
            TextButton(
                onPressed: () {}, child: Text('5 Year', style: fheading)),
            TextButton(
                onPressed: () {}, child: Text('Above 5 Year', style: fheading)),
          ],
        )
      ],
    );
  }

  Widget _buildRisk() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 193),
          child: Text(
            'Monthly Investment',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButton<String>(
          value: _dropdownMonthly,
          isExpanded: true,
          onChanged: (String? newValue) {
            setState(() {
              _dropdownMonthly = newValue!;
            });
          },
          items: List<DropdownMenuItem<String>>.generate(
            monthlyList.length,
            (int index) => new DropdownMenuItem<String>(
              value: monthlyList[index],
              child: new Text(
                monthlyList[index],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(right: 260),
          child: Text(
            'Risk Factor',
            style: eheading,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButton<String>(
          value: _dropdownRisk,
          isExpanded: true,
          onChanged: (String? newValue1) {
            setState(() {
              _dropdownRisk = newValue1!;
            });
          },
          items: List<DropdownMenuItem<String>>.generate(
            riskList.length,
            (int index) => new DropdownMenuItem<String>(
              value: riskList[index],
              child: new Text(
                riskList[index],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
