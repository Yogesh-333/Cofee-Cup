import 'package:coffee_shop_master_rebuild/listitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screens/login_screen.dart';
import 'screens/grid_view.dart';
import 'screens/sign_up.dart';
import 'screens/orderconfirmationscreen.dart';
import 'screens/details_page.dart';
import 'screens/reset_password.dart';
import 'package:coffee_shop_master_rebuild/home.dart';
import 'product_curd.dart';
import 'order_curd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(CoffeeApp());
}

//todo need to improve by using provider method

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context)=>ListItems()),
        ChangeNotifierProvider(create: (context)=>OrderItem()),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LandingPage.id,
          routes: {
            LandingPage.id:(context)=>LandingPage(),
           WelcomeScreen.id:(context)=> WelcomeScreen(),
           CoffeeHome.id:(context)=>CoffeeHome(),
           SignUp.id:(context)=>SignUp(),
           ResetPassword.id:(context)=>ResetPassword(),
           ProductDetails.id:(context)=>ProductDetails(),
           GridViewPage.id:(context)=>GridViewPage(),
            DetailsPage.id:(context)=>DetailsPage(),
            OrderPopScreen.id:(context)=>OrderPopScreen(),
            OrderConfirmation.id:(context)=>OrderConfirmation(),
          // CafeSearch.id:(context)=>CafeSearch(),

          },
        ),
    );
  }
}

class LandingPage extends StatelessWidget {
  static const id = 'landingscreen';
  final Future<FirebaseApp> _initializeFireBase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFireBase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error Loading: ${snapshot.error}"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User user = snapshot.data;
                print(snapshot.data);
                if (user == null) {
                  return WelcomeScreen();
                }
                else{
                  return CoffeeHome();
                }
              }
              return Scaffold(
                body: Center(
                  child: SpinKitFadingCube(
                    duration: Duration(seconds: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.brown[900] : Colors.yellow[600],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }

        return Scaffold(
          body: Center(
            child: Text("Connecting to the App..."),
          ),
        );
      },
    );
  }
}