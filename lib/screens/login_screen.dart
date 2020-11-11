import 'package:coffee_shop_master_rebuild/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../home.dart';
import 'sign_up.dart';
import 'reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slider_button/slider_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff654321), Color(0xff654321),Color(0xffa06a34), Color(0xffc9915a)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  int selectedCurveIndex = 1;
  List<int> curveList = [0, 1, 2, 3, 4];

  List<String> menuList = [
    "icon",
    "Sign in",
    "Sign up",
    "Reset",
    "extraSpace"
  ];

  Widget getCurvedShape(int index) {
    if (index < 4) {
      return Expanded(
        flex: 2,
        child: AnimatedContainer(
          width: selectedCurveIndex > 0 &&
                  selectedCurveIndex < 4 &&
                  selectedCurveIndex == index
              ? double.infinity
              : 0,
          duration: Duration(seconds: 0),
          child: Stack(
            children: <Widget>[
              CustomPaint(painter: DrawCurveBulged(), child: Container()),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: -1,
                top: 18,
                child: Container(
                  width: 3,
                  height: 137,
                  color: Color(0xFF62493b),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Expanded(flex: 1, child: Container());
    }
  }

  Widget getMenuList(int index) {
    if (index > 0 && index < 4) {
      return Expanded(
        flex: 3,
        child: GestureDetector(
          onTap: () {
            selectedCurveIndex = index;
            setState(() {
              if (index == 2) {
                Navigator.pushNamed(context, SignUp.id);
              } else if (index == 3) {
                Navigator.pushNamed(context, ResetPassword.id);
              }
            });
          },
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    menuList[index],
                    style: TextStyle(color: Color(0xFFdbb891), fontSize: 20),
                  ),
                ),
                //SizedBox(width: 0),
                selectedCurveIndex == index
                    ? Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Color(0xFFd8b792),
                          ),
                        ),
                      )
                    : Container(width: 11, height: 11),
              ],
            ),
          ),
        ),
      );
    } else {
      if (index == 0) {
        return Expanded(
          flex: 2,
          child: Container(
            child: Transform.rotate(
              angle: 90 * (22 / 1260),
              child: Icon(
                Icons.menu,
                size: 25,
                color: Color(0xFFdfb881),
              ),
            ),
          ),
        );
      } else {
        return Expanded(child: Container());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF62493b),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: 14),
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 15,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              menuList.asMap().entries.map((MapEntry map) {
                            return getMenuList(map.key);
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFdc9d40),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 15,
                      child: Container(
                        child: ClipRRect(

                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image:
                                        AssetImage("assets/images/stretch.png"),
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                textDirection: TextDirection.ltr,
                                bottom: -150,
                                end: -1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(90),
                                  ),
                                  child: Image(
                                    height: 500,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/first_page.jpg"),
                                  ),
                                ),
                              ),
                              Container(
                                width: 36,
                                padding: EdgeInsets.only(top: 14),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: curveList
                                              .asMap()
                                              .entries
                                              .map((MapEntry map) {
                                            return getCurvedShape(map.key);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40, top: 50),
                                child: ListView(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                   Text('Coffee Cup',style: TextStyle(
                                       fontFamily: 'varela',
                                       fontSize: 80.0,
                                       fontWeight: FontWeight.bold,
                                    foreground: Paint()..shader = linearGradient),
                                                                              ),
                                    SizedBox(height: 25),
                                    Text(
                                      "A wide range of specialty",
                                      style: TextStyle(
                                          color: Color(0xFF9e9894),
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "coffees, tea and beverages.",
                                      style: TextStyle(
                                          color: Color(0xFF9e9894),
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 50),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      width: 15,
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius: BorderRadius.circular(8.0)),
                                      child: TextFormField(
                                        cursorColor: Colors.brown,
                                        onChanged: (value) {
                                          email = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Email Address",
                                            labelStyle: TextStyle(fontSize: 14,color: Colors.black),
                                            prefixIcon: Icon(
                                              Icons.mail_outline,
                                              size: 24,
                                              color:  Color(0xFF4c3e33),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 1),
                                              borderRadius: BorderRadius.circular(8.0),
                                            )),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      width: 15,
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius: BorderRadius.circular(8.0)),
                                      child: TextFormField(
                                        cursorColor: Colors.brown,
                                        obscureText: true,
                                        keyboardType: TextInputType.visiblePassword,
                                        onChanged: (value) {
                                          password = value;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Password",
                                            labelStyle: TextStyle(fontSize: 14,color: Colors.black),
                                            prefixIcon: Icon(
                                              Icons.vpn_key,
                                              size: 24,
                                              color:  Color(0xFF4c3e33),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 1),
                                              borderRadius: BorderRadius.circular(8.0),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: EdgeInsets.only(left: 80, right: 30),
                            child: SliderButton(
                              action: () async {
                                if(email !=null&&password !=null){
                                try {
                                  final newUser =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (newUser != null) {
                                    Navigator.pushReplacementNamed(context, CoffeeHome.id);
                                  }
                                  else if(newUser == null){
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "ALERT",
                                      desc: "Please give valid input",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Okay",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () {
                                            Navigator.popAndPushNamed(context, WelcomeScreen.id);
                                          },
                                          width: 120,
                                          color: Colors.yellow[800],
                                        )
                                      ],
                                    ).show();
                                  }
                                } catch (e) {
                                  print(e);}}
                                else{Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "ALERT",
                                  desc: "Please give valid input",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Okay",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        Navigator.popAndPushNamed(context, WelcomeScreen.id);
                                      },
                                      width: 120,
                                      color: Colors.yellow[800],
                                    )
                                  ],
                                ).show();}

                              },
                              label: Text(
                                "     Slide to sign up",
                                style: TextStyle(
                                    color: Color(0xff4a4a4a),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              icon: Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 35.0,
                                semanticLabel:
                                    '  Slide to  sign up',
                              )),

                              ///Change All the color and size from here.
                              width: 230,
                              radius: 20,
                              buttonColor: Colors.white,
                              backgroundColor: Color(0xFFdc9d40),
                              highlightedColor: Colors.white,
                              baseColor: Colors.black,
                            ),),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawCurveBulged extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF62493b)
      ..style = PaintingStyle.fill;
    Path path = Path();

    path.moveTo(-1, 0);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.125 * 1.8,
        size.width * .35, size.height * .125 * 2.52);

    path.quadraticBezierTo(size.width * .125 * 6, size.height * 0.125 * 4,
        size.width * .25, size.height * .125 * 5.8);

    path.quadraticBezierTo(
        size.width * .1, size.height * 0.125 * 6.52, -1, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
