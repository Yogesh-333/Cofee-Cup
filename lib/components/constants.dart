import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.brown,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);


const KTextFieldDecoration = InputDecoration(
  hintText: 'Enter your email' ,
  fillColor: Colors.white,
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff9D6E5B), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:  Color(0xff9D6E5B), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
