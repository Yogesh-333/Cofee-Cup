import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKit extends StatefulWidget {

  @override
  _SpinKitState createState() => _SpinKitState();
}


class _SpinKitState extends State<SpinKit> {

  @override
  Widget build(BuildContext context) {
    return Container(
  child:SpinKitFadingCube(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.brown[900] : Colors.yellow[600],
        ),
      );
    },
    ),
    );
  }
}


