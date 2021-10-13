import 'package:flutter/material.dart';
// import 'package:mutual_fund/guest_login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:mutual_fund/home_screen.dart';

// import 'package:mutual_fund/home_screen.dart';
// import 'package:mutual_fund/home_screen.dart';
// import 'package:mutual_fund/guest_login.dart';
// import 'package:mutual_fund/home_login.dart';
// import 'package:mutual_fund/getting_started.dart';
// import 'package:mutual_fund/home_screen.dart';
// import 'package:mutual_fund/getting_started.dart';
// import 'package:mutual_fund/home_screen.dart';
// import 'package:mutual_fund/home_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
