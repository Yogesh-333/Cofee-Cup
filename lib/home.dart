import 'package:coffee_shop_master_rebuild/components/selectionButtonWidget.dart';
import 'package:coffee_shop_master_rebuild/product_curd.dart';
import 'package:provider/provider.dart';
import 'listitem.dart';
import 'package:coffee_shop_master_rebuild/screens/grid_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cafe_model.dart';
import 'screens/login_screen.dart';

User loggedInUser;

class ItemGot {
  final String imageUrl, name, price, description1, description2, type;
  final bool featured;

  ItemGot({
    @required this.name,
    @required this.imageUrl,
    @required this.description1,
    @required this.description2,
    @required this.price,
    @required this.type,
    @required this.featured,
  });
}

class CoffeeHome extends StatefulWidget {
  static const id = 'coffeeHome';
  @override
  _CoffeeHomeState createState() => _CoffeeHomeState();
}

class _CoffeeHomeState extends State<CoffeeHome> {
  int selectedSideMenuIndex = 0;
  int filterValue = 0;
  List<String> sideList = ["Featured", "Coffee", "Tea"];
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    ListItems listitems = Provider.of<ListItems>(context, listen: false);
    listitems.getItem(listitems);
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget sideWidget(int index) {
    return GestureDetector(
      onTap: () {
        selectedSideMenuIndex = index;
        setState(() {
          if (index == 0) {
            print(index);
            filterValue = index;
          } else if (index == 1) {
            print(index);
            filterValue = index;
          } else if (index == 2) {
            print(index);
            filterValue = index;
          } else {
            filterValue = 3;
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedSideMenuIndex == index
                        ? Color(0xFFcd9847)
                        : Colors.white,
                    width: 2),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(width: 5),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              sideList[index],
              style: TextStyle(
                  color: selectedSideMenuIndex == index
                      ? Color(0xFFcd9847)
                      : Color(0xFF5a4941),
                  fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget getItemWidget(
    index,
    item,
  ) {
    if (item.featured != false && filterValue==0) {
      return Container(
        padding: EdgeInsets.only(left: index == 0 ? 35 : 0),
        margin: EdgeInsets.only(right: 19),
        width: index == 0 ? 240 : 205,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(75),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  color: Color(0xFFd39233),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Container(
                          width: double.infinity,
                          padding:
                          EdgeInsets.only(left: 24, right: 24, top: 61),
                          decoration: BoxDecoration(
                              color: Color(0xFFf3f0f1),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(23),
                                  bottomLeft: Radius.circular(23))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(
                                    color: Color(0xFF917264),
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(height: 5),
                              Text(
                               item.description1,
                                style: TextStyle(
                                    color: Color(0xFFc8b7af), fontSize: 15),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 18, right: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '\$${item.price}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.clip,
                              ),
                              Icon(Icons.add, color: Colors.white, size: 29)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 30,
              top: -2,
              child: Image(
                width: 170,
                height: 90,
                fit: BoxFit.contain,
                image: NetworkImage(item.imageUrl),
              ),
            ),
          ],
        ),
      );

    }
    else if(item.type == 'coffee' && filterValue==1){return Container(
      padding: EdgeInsets.only(left: index == 0 ? 35 : 0),
      margin: EdgeInsets.only(right: 19),
      width: index == 0 ? 240 : 205,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(75),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                color: Color(0xFFd39233),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.only(left: 24, right: 24, top: 61),
                        decoration: BoxDecoration(
                            color: Color(0xFFf3f0f1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.name,
                              style: TextStyle(
                                  color: Color(0xFF917264),
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(height: 5),
                            Text(
                              item.description1,
                              style: TextStyle(
                                  color: Color(0xFFc8b7af), fontSize: 15),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,
                            ),
                            Icon(Icons.add, color: Colors.white, size: 29)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: 30,
            top: -2,
            child: Image(
              width: 170,
              height: 90,
              fit: BoxFit.contain,
              image: NetworkImage(item.imageUrl),
            ),
          ),
        ],
      ),
    );}
    else if(item.type == 'tea' && filterValue==2){ return Container(
      padding: EdgeInsets.only(left: index == 0 ? 35 : 0),
      margin: EdgeInsets.only(right: 19),
      width: index == 0 ? 240 : 205,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(75),
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                color: Color(0xFFd39233),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.only(left: 24, right: 24, top: 61),
                        decoration: BoxDecoration(
                            color: Color(0xFFf3f0f1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.name,
                              style: TextStyle(
                                  color: Color(0xFF917264),
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(height: 5),
                            Text(
                              item.description1,
                              style: TextStyle(
                                  color: Color(0xFFc8b7af), fontSize: 15),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 18, right: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${item.price}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.clip,
                            ),
                            Icon(Icons.add, color: Colors.white, size: 29)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: 30,
            top: -2,
            child: Image(
              width: 170,
              height: 90,
              fit: BoxFit.contain,
              image: NetworkImage(item.imageUrl),
            ),
          ),
        ],
      ),
    );}
    return Container();
  }

  Widget getCafeWidget(Cafe cafe) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
      height: 90,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(54),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image(
                height: 90,
                width: 90,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${cafe.imageUrl}"),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only(left: 21, top: 6, bottom: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cafe.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xFF56463b), fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    cafe.address,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xFFc8b7af), fontSize: 20.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            leading: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            title: Text(
              '      Hi! ${loggedInUser.email}', //todo add user name field
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
            actions: <Widget>[
              loggedInUser.email == 'cof@gmail.com' //as ADMIN
                  ? Column(
                      children: [
                        IconButton(
                            icon: Icon(EvaIcons.fileAddOutline),
                            color: Colors.black,
                            iconSize: 20.0,
                            onPressed: () {
                              Navigator.pushNamed(context, ProductDetails.id);
                            }),
                        Text(
                          'Add ',
                          style: TextStyle(
                            fontSize: 5.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              loggedInUser.email == 'app@agumentik.com' //as ADMIN
                  ? Column(
                children: [
                  IconButton(
                      icon: Icon(EvaIcons.fileAddOutline),
                      color: Colors.black,
                      iconSize: 20.0,
                      onPressed: () {
                        Navigator.pushNamed(context, ProductDetails.id);
                      }),
                  Text(
                    'Add ',
                    style: TextStyle(
                      fontSize: 5.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
                  : Container(),
              SizedBox(width: 10.0),
              Column(
                children: [
                  IconButton(
                      icon: Icon(EvaIcons.logOut),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: () {
                        _auth.signOut();
                        //Navigator.of(context).pushNamedAndRemoveUntil(WelcomeScreen.id);
                        Navigator.pushReplacementNamed(
                            context, WelcomeScreen.id);
                      }),
                  Text(
                    'log out ',
                    style: TextStyle(
                      fontSize: 5.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.0),
            ],
            backgroundColor: Color(0xFFdd9e42),
          ),
        ),
        backgroundColor: Color(0xFF624639),
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 50, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Pick of the day",
                                  style: TextStyle(
                                      color: Color(0xFFc6b3aa), fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Vanilla Espresso", //Todo nee to be set by Admin
                                  style: TextStyle(
                                      color: Color(0xFFfefcfa), fontSize: 25),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 185,
                                  padding: EdgeInsets.only(top: 2),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFdd9e42),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'only ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.5),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '\$3.25',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                          ),
                          child: Container(
                            color: Colors.white,
                            child: ListView(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  height: 310,
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 35),
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: sideList
                                                .asMap()
                                                .entries
                                                .map((MapEntry map) {
                                              return sideWidget(map.key);
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          child: Consumer<ListItems>(
                                            builder:
                                                (context, itemData, child) {
                                              return ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: itemData.itemCount,
                                                itemBuilder: (context, index) {
                                                  return getItemWidget(index,
                                                      itemData.items[index]);
                                                },
                                              );
                                            },
                                          ),
                                        ),

                                        // child: ListView(
                                        //   scrollDirection: Axis.horizontal,
                                        //   children:item
                                        //       .asMap()
                                        //       .entries
                                        //       .map((MapEntry map) {
                                        //     return getItemsWidget(
                                        //         map.key, map.value);
                                        //   }).toList(),
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 30.0,
                                  margin: EdgeInsets.only(
                                      left: 26, right: 26, top: 26, bottom: 16),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // Text(
                                      //   "Choose a Store",//todo implement google place API
                                      //   overflow: TextOverflow.fade,
                                      //   style: TextStyle(
                                      //     fontSize: 21,
                                      //     color: Color(0xFF5e4337),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      GradientSelectionButton(
                                        label: 'Check more products',
                                        startColor: Colors.white,
                                        endColor: Colors.white,
                                        height: 120,
                                        width: 180,
                                        textColor: Colors.brown[400],
                                        onPressedFunction: () {
                                          Navigator.pushNamed(
                                              context, GridViewPage.id);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                for (Cafe cafeValue in cafeList)
                                  getCafeWidget(cafeValue)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: -90,
                end: -85,
                child: Transform.scale(
                  scale: 0.44,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/espresso_coffee.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
