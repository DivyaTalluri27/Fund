import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mutual_fund/widgets/getting_started_widgets.dart';

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
          titleWidget: BuildTitle(),
          bodyWidget: BuildInvest(),
          image: _buildImage('img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: BuildTitle(),
          bodyWidget: BuildTax(),
          image: _buildImage('img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: BuildTitle(),
          bodyWidget: BuildRisk(),
          image: _buildImage('img3.png'),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
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
}
