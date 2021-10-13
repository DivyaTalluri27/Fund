// import 'dart:convert';

// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mutual_fund/palatte.dart';
import 'package:mutual_fund/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class GuestLogin extends StatefulWidget {
  const GuestLogin({Key? key}) : super(key: key);

  @override
  State<GuestLogin> createState() => _GuestLoginState();
}

class User {
  // late String refresh;
  late String access;
  User(Map<String, dynamic> data) {
    // refresh = data['refresh'];
    access = data['access'];
  }
}

class _GuestLoginState extends State<GuestLogin> {
  // GoogleSignInAccount? _currentUser;
  // String _contactText = '';

  bool agree = false;

  late String token;
  late String idtoken;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<dynamic> authenticate(String idtoken) async {
    print('abcdef' + idtoken);

    http.get(
      Uri.parse(
          "https://mutualfunds-uatplus.aliceblueonline.com/login/auth/google"),
      headers: {
        'Accept': 'application/json',
        // 'authorization': 'pass your key(optional)'
        'Authorization': idtoken,
      },
    );

    //     body: {
    //       "auth_token": idtoken,
    //     }).then((response) {
    //   print(response.statusCode);
    //   // print(response.body);
    //   // var data = json.decode(response.body);
    //   // var jsonData = data['tokens'];
    //   // var user = User(jsonData);
    //   // print(' ${user.access}');
    // }
  }

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);

      token = googleSignInAuthentication.accessToken!;
      idtoken = googleSignInAuthentication.idToken!;
      print('Access Token: ' + token);
      print('ID Token: ' + idtoken);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getSizedBox(),
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("Guest Login",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color(0xffD1D9EC),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 70),
                    child: TextField(
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(
                            top: 10,
                            bottom: 15,
                          ),
                          hintText: '+919999999926',
                          alignLabelWithHint: true,
                          hintStyle:
                              TextStyle(height: 3, color: Color(0xffD6D6D6)),
                          errorStyle: TextStyle(color: Colors.red),
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(
                              fontSize: 16, color: Color(0xffFFFFFF))),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  getSizedBox(),
                  Container(
                    // margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.only(
                      left: 47,
                    ),
                    child: MaterialButton(
                        height: 36,
                        minWidth: 290,
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        onPressed: () {},
                        child: const Text('CONTINUE', style: cheading),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        color: const Color(0xffffffff)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 140),
                    child: Text(
                      "OR, Login using",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('G+',
                            style: TextStyle(
                                color: Color(0xffFF8F8F), fontSize: 15)),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 10),
                          ),
                          onPressed: () {
                            signInwithGoogle();
                            // signOutFromGoogle();
                            authenticate(token);
                            // print('bbbhd' + token);
                            signOutFromGoogle();
                          },
                          child: const Text(
                            'CONTINUE WITH GOOGLE',
                            style: TextStyle(
                                color: Color(
                                  0xffFF8F8F,
                                ),
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Checkbox(
                        side: const BorderSide(
                          // ======> CHANGE THE BORDER COLOR HERE <======
                          color: Colors.white,
                          // Give your checkbox border a custom width
                          width: 1.7,
                        ),
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree = value ?? false;
                          });
                        },
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: 'By logging in, you agree to our',
                          style:
                              TextStyle(color: Color(0xffC6C6C6), fontSize: 12),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Terms and Condition',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                )),
                            TextSpan(
                                text: '\nand',
                                style: TextStyle(
                                    color: Color(0xffC6C6C6), fontSize: 12)),
                            TextSpan(
                                text: ' Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                )),
                          ]),
                    ),
                  ]),
                ]),
          ),
        ),
      ],
    );
  }

  // Future<void> _handleSignIn() async {
  //   print('a');
  //   try {
  //     GoogleSignInAccount user = await _googleSignIn.signIn();

  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await user!.authentication;

  //     print(googleSignInAuthentication.accessToken);
  //     print('abc');
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Widget getSizedBox() {
    return SizedBox(
      height: 20,
      width: 20,
    );
  }
}
