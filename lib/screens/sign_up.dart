import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:coffee_shop_master_rebuild/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:coffee_shop_master_rebuild/components/constants.dart';
import 'package:coffee_shop_master_rebuild/components/selectionButtonWidget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'login_screen.dart';

class SignUp extends StatefulWidget {
  static const id = 'signUpScreen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showSpinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  handleSubmit() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser != null) {
        Navigator.pushNamed(context, CoffeeHome.id);
      }
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color(0xFFE4E4E4),
          bottomSheet: Container(
            color: Color(0xFFdc9d40),
            child: Row(
              children: [
                SizedBox(width: 100,),
                selectionButtonWidget(
                  color: Colors.brown[900],
                  label: 'Sign Up',
                  onPressed: () {
                    if (email != null && password != null) {
                      handleSubmit();
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "ALERT",
                        desc: "Please give valid input",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Okay",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () { Navigator.pushReplacementNamed(context, WelcomeScreen.id);},
                            width: 120,
                            color: Colors.yellow[800],
                          ),
                        ],
                      ).show();
                    }
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    color: Color(0xffE4E4E4),
                    height: 200.0,
                    child: Image(
                      image: AssetImage("assets/images/coffee_logo.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      KTextFieldDecoration.copyWith(hintText: 'Email Address'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      KTextFieldDecoration.copyWith(hintText: 'Password'),
                ),
              ],
            ),
          ),
        ),
        showSpinner
            ? SpinKitFadingCube(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color:
                          index.isEven ? Colors.brown[900] : Colors.yellow[600],
                    ),
                  );
                },
              )
            : Stack(),
      ],
    );
  }
}
