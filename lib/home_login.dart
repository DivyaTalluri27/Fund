// import 'dart:io';
//
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mutual_fund/guest_login.dart';
import 'package:mutual_fund/palatte.dart';

import 'package:mutual_fund/widgets/web_url.dart';
import 'package:mutual_fund/widgets/widgets.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({Key? key}) : super(key: key);

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  // ignore: unused_field
  // late WebViewController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   // Enable hybrid composition.
  // }

  @override
  Widget build(BuildContext context) {
    // const String toLaunch = 'https://ant.aliceblueonline.com/';

    // ignore: unused_local_variable
    // Future<void>? _launched;
    // Future<void> _launchInBrowser(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(
    //       'https://ant.aliceblueonline.com/',
    //       forceSafariVC: true,
    //       forceWebView: true,
    //       headers: <String, String>{'my_header_key': 'my_header_value'},
    //     );
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 41),
                  child: Text(
                    "AliceBlue\nMutual Fund",
                    textAlign: TextAlign.start,
                    style: aheading,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 42),
                  // margin: const EdgeInsets.only(left: 37),
                  child: const Text(
                    "Click here for",
                    textAlign: TextAlign.start,
                    style: aheading,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 41),
                  child: Text(
                    "ANT LOGIN",
                    textAlign: TextAlign.start,
                    style: bheading,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  // margin: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.only(left: 42),
                  child: MaterialButton(
                      height: 36,
                      minWidth: 290,
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebUrl1()),
                        );
                      },
                      child: const Text('ANT LOGIN', style: cheading),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      color: const Color(0xffffffff)),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 170),
                  child: Text(
                    "OR",
                    textAlign: TextAlign.start,
                    style: aheading,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 330,
                  height: 60,
                  padding: const EdgeInsets.only(left: 41, bottom: 10, top: 10),
                  child: TextButton(
                      child: const Text("Guest User",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffFFFFFF),
                          )),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(5)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: const BorderSide(
                                          color: Color(0xffffffff))))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GuestLogin()),
                        );
                      }),
                ),
              ]),
        ),
      ],
    );
  }
}

  // Widget _buildUrl() {
  //   return WebView(
  //     initialUrl: 'https://ant.aliceblueonline.com/',
  //     onWebViewCreated: (WebViewController webViewController) {
  //       _controller = webViewController;
  //     },
  //   );
  // }

