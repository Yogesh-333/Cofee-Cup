import 'package:coffee_shop_master_rebuild/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:coffee_shop_master_rebuild/components/constants.dart';
import 'package:coffee_shop_master_rebuild/components/selectionButtonWidget.dart';
import 'file:///D:/Argumentik%20flutter/coffee_shop_master_rebuild/lib/components/spin.dart';


class ResetPassword extends StatefulWidget {
  static const id = 'resetPassword';
  @override

  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool showSpinner = false;
  String email;
  final _auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFE4E4E4),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image(
                  image: AssetImage("assets/images/coffee_logo2.png"),
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
                email=value;
              },
              decoration:
              KTextFieldDecoration.copyWith(hintText: 'Email Address'),
            ),
            SizedBox(
              height: 8.0,
            ),
             selectionButtonWidget(
              color: Colors.brown[900],
              label: 'Reset',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SpinKit(),),);
               resetPassword(email);
               Alert(
                 context: context,
                 type: AlertType.success,
                 title: "Request Successful ",
                 desc: "Check your email ",
                 buttons: [
                   DialogButton(
                     child: Text(
                       "OK",
                       style: TextStyle(color: Colors.white, fontSize: 20),
                     ),
                     onPressed: (){
                       Navigator.pushReplacementNamed(context, WelcomeScreen.id);
                     } ,
                     color: Colors.yellow[800],
                     width: 120,
                   )
                 ],
               ).show();
              },
            ),
          ],
        ),
      ),
    );;
  }
}
