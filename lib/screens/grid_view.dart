import 'package:coffee_shop_master_rebuild/listitem.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'details_page.dart';

//import 'package:coffee_shop_master_rebuild/components/selectionButtonWidget.dart';
class GridViewPage extends StatefulWidget {
  static const id = 'gridView';
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _selectedIndex = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }


  @override
  Widget build(BuildContext context) {
    String title = "afd";
    return Scaffold(
      body: Consumer<ListItems>(
        builder: (context, itemData, child) {
          return MaterialApp(
            title: title,
            home: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                key: _bottomNavigationKey,
                index: 2,
                height: 50.0,
                items: <Widget>[
                  Icon(Icons.home, size: 30,
                    semanticLabel: 'All',
                    color: Colors.amber,),
                  Icon(MdiIcons.heart, size: 30, color: Colors.amber),
                  Icon(MdiIcons.coffee, size: 30, color: Colors.amber),
                  Icon(MdiIcons.beer, size: 30, color: Colors.amber),
                  Icon(MdiIcons.glassMugVariant, size: 30, color: Colors.amber),
                ],
                color: Colors.brown[900],
                buttonBackgroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 600),
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  ListView(
                    children: List.generate(itemData.itemCount, (index) {
                      return getItemWidget(index, itemData.items[index]);
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  // Widget getItemWidget(
  //   index,
  //   item,
  // ) {
  //   return GestureDetector(
  //     child: Container(
  //       padding: EdgeInsets.only(top: index == null ? 35 : 0),
  //       margin: EdgeInsets.only(bottom: 2),
  //       height: index == null ? 240 : 205,
  //       child: Stack(
  //         children: <Widget>[
  //           Container(
  //             padding:
  //                 EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
  //             child: Material(
  //               borderRadius: BorderRadius.only(
  //                 topRight: Radius.circular(20),
  //                 topLeft: Radius.circular(20),
  //                 bottomLeft: Radius.circular(20),
  //                 bottomRight: Radius.circular(20),
  //               ),
  //               elevation: 30,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.only(
  //                   topRight: Radius.circular(20),
  //                   topLeft: Radius.circular(20),
  //                   bottomLeft: Radius.circular(20),
  //                   bottomRight: Radius.circular(20),
  //                 ),
  //                 child: Container(
  //                   color: Color(0xFFFFF),
  //                   child: Column(
  //                     children: <Widget>[
  //                       Expanded(
  //                         flex: 7,
  //                         child: Container(
  //                           width: double.infinity,
  //                           padding:
  //                               EdgeInsets.only(left: 24, right: 24, top: 6),
  //                           decoration: BoxDecoration(
  //                             color: Color(0xFFf3f0f1),
  //                           ),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: <Widget>[
  //                               Text(
  //                                 item.name,
  //                                 style: TextStyle(
  //                                     color: Color(0xFF917264),
  //                                     fontSize: 22,
  //                                     fontWeight: FontWeight.bold),
  //                                 overflow: TextOverflow.clip,
  //                               ),
  //                               SizedBox(height: 33),
  //                               Text(
  //                                 item.description1,
  //                                 style: TextStyle(
  //                                     color: Color(0xFFc8b7af), fontSize: 15.5),
  //                                 overflow: TextOverflow.clip,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       Expanded(
  //                         flex: 2,
  //                         child: Container(
  //                           padding: EdgeInsets.only(left: 18, right: 18),
  //                           child: Row(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: <Widget>[
  //                               RichText(
  //                                 text: TextSpan(
  //                                     text: '\$ ',
  //                                     style: TextStyle(
  //                                         color: Color(0xFFd39233),
  //                                         fontSize: 23,
  //                                         fontWeight: FontWeight.bold),
  //                                     children: [
  //                                       TextSpan(
  //                                         text: item.price.toString(),
  //                                         style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontSize: 23,
  //                                           fontWeight: FontWeight.w400,
  //                                         ),
  //                                       )
  //                                     ]),
  //                                 overflow: TextOverflow.clip,
  //                               ),
  //                               IconButton(
  //                                 icon: Icon(EvaIcons.plusSquareOutline,
  //                                     color: Colors.brown[400], size: 29),
  //                                 onPressed: () {
  //                                   Alert(
  //                                     context: context,
  //                                     type: AlertType.none,
  //                                     title: "Done",
  //                                     desc: "Added to cart",
  //                                     buttons: [
  //                                       DialogButton(
  //                                         child: Text(
  //                                           "continue",
  //                                           style: TextStyle(
  //                                               color: Colors.white,
  //                                               fontSize: 20),
  //                                         ),
  //                                         onPressed: () =>
  //                                             Navigator.pop(context),
  //                                         width: 120,
  //                                         color: Colors.yellow[800],
  //                                       )
  //                                     ],
  //                                   ).show();
  //                                 },
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //          item.featured? Positioned.directional(
  //             textDirection: TextDirection.ltr,
  //             start: 170,
  //             top: 4,
  //            child:  Icon(
  //              Icons.favorite,
  //              color: Colors.redAccent,
  //              size: 35.0,)
  //            ): Container() ,
  //           Positioned.directional(
  //             textDirection: TextDirection.ltr,
  //             start: 100,
  //             top: 50,
  //             child: Image(
  //               width: 80,
  //               height: 90,
  //               fit: BoxFit.contain,
  //               image: NetworkImage(item.imageUrl),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     onTap: () {
  //       int cardIndex = index;
  //       print(cardIndex);
  //       Navigator.pushNamed(context, DescribedProduct.id,
  //           arguments:  {'index': cardIndex});
  //     },
  //   );
  // }
  Widget getItemWidget(index,
     item,) {
    if (_selectedIndex == 0) {
      return GestureDetector  (
        child: Container(
          padding: EdgeInsets.only(top: index == null ? 35 : 0),
          margin: EdgeInsets.only(bottom: 2),
          height: index == null ? 240 : 205,
          child: Stack(
            children: <Widget>[
              Container(
                padding:
                EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  elevation: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Color(0xFFFFF),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Container(
                              width: double.infinity,
                              padding:
                              EdgeInsets.only(left: 24, right: 24, top: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFf3f0f1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Color(0xFF917264),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                        item.description1,
                                      style: TextStyle(
                                          color: Color(0xFFc8b7af),
                                          fontSize: 20),
                                      overflow: TextOverflow.clip,
                                    ),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RichText(
                                    text: TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                            color: Color(0xFFd39233),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: item.price.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              item.featured
                  ? Positioned.directional(
                  textDirection: TextDirection.ltr,
                  start: 370,
                  top: 4,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 35.0,
                  ))
                  : Container(),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 200,
                top: 5,
                child: Image(
                  width: 190,
                  height: 150,
                  fit: BoxFit.contain,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          int cardIndex = index;
          Color backColor;
          if(item.type=='coffee'){
            backColor=Color(0xFFE8A876);
          }
          else if(item.type=='tea'){
            backColor= Color(0xFF41B3A3);
          }
          else if(item.type=='shake'){
            backColor= Color(0xFFF3B2B7);
          }
          else if(item.type=='juice'){
            backColor= Color(0xFFF76C6C);
          }
          // Navigator.pushNamed(context, DescribedProduct.id,
          //     arguments: {'index': cardIndex});
          Navigator.pushNamed(context, DetailsPage.id,arguments: {'index': cardIndex , 'color':backColor});
        },
      );
    }
    else if (item.featured != false && _selectedIndex == 1) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: index == null ? 35 : 0),
          margin: EdgeInsets.only(bottom: 2),
          height: index == null ? 240 : 205,
          child: Stack(
            children: <Widget>[
              Container(
                padding:
                EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  elevation: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Color(0xFFFFF),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Container(
                              width: double.infinity,
                              padding:
                              EdgeInsets.only(left: 24, right: 24, top: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFf3f0f1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Color(0xFF917264),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      item.description1,
                                      style: TextStyle(
                                          color: Color(0xFFc8b7af),
                                          fontSize: 20),
                                      overflow: TextOverflow.clip,
                                    ),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RichText(
                                    text: TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                            color: Color(0xFFd39233),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: item.price.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              item.featured
                  ? Positioned.directional(
                  textDirection: TextDirection.ltr,
                  start: 370,
                  top: 4,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 35.0,
                  ))
                  : Container(),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 200,
                top: 5,
                child: Image(
                  width: 190,
                  height: 150,
                  fit: BoxFit.contain,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          int cardIndex = index;
          Color backColor;
          if(item.type=='coffee'){
            backColor=Color(0xFFE8A876);
          }
          else if(item.type=='tea'){
            backColor= Color(0xFF41B3A3);
          }
          else if(item.type=='shake'){
            backColor= Color(0xFFF3B2B7);
          }
          else if(item.type=='juice'){
            backColor= Color(0xFFF76C6C);
          }
          // Navigator.pushNamed(context, DescribedProduct.id,
          //     arguments: {'index': cardIndex});
          Navigator.pushNamed(context, DetailsPage.id,arguments: {'index': cardIndex , 'color':backColor});
        },
      );
    }
    else if (item.type == 'coffee' && _selectedIndex == 2) {
       return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: index == null ? 35 : 0),
          margin: EdgeInsets.only(bottom: 2),
          height: index == null ? 240 : 205,
          child: Stack(
            children: <Widget>[
              Container(
                padding:
                EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  elevation: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Color(0xFFFFF),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Container(
                              width: double.infinity,
                              padding:
                              EdgeInsets.only(left: 24, right: 24, top: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFf3f0f1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Color(0xFF917264),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      item.description1,
                                      style: TextStyle(
                                          color: Color(0xFFc8b7af),
                                          fontSize: 20),
                                      overflow: TextOverflow.clip,
                                    ),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RichText(
                                    text: TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                            color: Color(0xFFd39233),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: item.price.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              item.featured
                  ? Positioned.directional(
                  textDirection: TextDirection.ltr,
                  start: 370,
                  top: 4,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 35.0,
                  ))
                  : Container(),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 200,
                top: 5,
                child: Image(
                  width: 190,
                  height: 150,
                  fit: BoxFit.contain,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          int cardIndex = index;
          Color backColor;
          if(item.type=='coffee'){
            backColor=Color(0xFFE8A876);
          }
          else if(item.type=='tea'){
            backColor= Color(0xFF41B3A3);
          }
          else if(item.type=='shake'){
            backColor= Color(0xFFF3B2B7);
          }
          else if(item.type=='juice'){
            backColor= Color(0xFFF76C6C);
          }
          // Navigator.pushNamed(context, DescribedProduct.id,
          //     arguments: {'index': cardIndex});
          Navigator.pushNamed(context, DetailsPage.id,arguments: {'index': cardIndex , 'color':backColor});
        },
      );
    } else if (item.type == 'tea' && _selectedIndex == 3) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: index == null ? 35 : 0),
          margin: EdgeInsets.only(bottom: 2),
          height: index == null ? 240 : 205,
          child: Stack(
            children: <Widget>[
              Container(
                padding:
                EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  elevation: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Color(0xFFFFF),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Container(
                              width: double.infinity,
                              padding:
                              EdgeInsets.only(left: 24, right: 24, top: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFf3f0f1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Color(0xFF917264),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      item.description1,
                                      style: TextStyle(
                                          color: Color(0xFFc8b7af),
                                          fontSize: 20),
                                      overflow: TextOverflow.clip,
                                    ),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RichText(
                                    text: TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                            color: Color(0xFFd39233),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: item.price.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              item.featured
                  ? Positioned.directional(
                  textDirection: TextDirection.ltr,
                  start: 370,
                  top: 4,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 35.0,
                  ))
                  : Container(),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 200,
                top: 5,
                child: Image(
                  width: 190,
                  height: 150,
                  fit: BoxFit.contain,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          int cardIndex = index;
          Color backColor;
          if(item.type=='coffee'){
            backColor=Color(0xFFE8A876);
          }
          else if(item.type=='tea'){
            backColor= Color(0xFF41B3A3);
          }
          else if(item.type=='shake'){
            backColor= Color(0xFFF3B2B7);
          }
          else if(item.type=='juice'){
            backColor= Color(0xFFF76C6C);
          }
          // Navigator.pushNamed(context, DescribedProduct.id,
          //     arguments: {'index': cardIndex});
          Navigator.pushNamed(context, DetailsPage.id,arguments: {'index': cardIndex , 'color':backColor});
        },
      );
    }
    else if (item.type == 'shake' && _selectedIndex == 4) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: index == null ? 35 : 0),
          margin: EdgeInsets.only(bottom: 2),
          height: index == null ? 240 : 205,
          child: Stack(
            children: <Widget>[
              Container(
                padding:
                EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                child: Material(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  elevation: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      color: Color(0xFFFFF),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: Container(
                              width: double.infinity,
                              padding:
                              EdgeInsets.only(left: 24, right: 24, top: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFf3f0f1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Color(0xFF917264),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    height: 50,
                                    width: 200,
                                    child: Text(
                                      item.description1,
                                      style: TextStyle(
                                          color: Color(0xFFc8b7af),
                                          fontSize: 20),
                                      overflow: TextOverflow.clip,
                                    ),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  RichText(
                                    text: TextSpan(
                                        text: '\$ ',
                                        style: TextStyle(
                                            color: Color(0xFFd39233),
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                            text: item.price.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              item.featured
                  ? Positioned.directional(
                  textDirection: TextDirection.ltr,
                  start: 370,
                  top: 4,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 35.0,
                  ))
                  : Container(),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 200,
                top: 5,
                child: Image(
                  width: 190,
                  height: 150,
                  fit: BoxFit.contain,
                  image: NetworkImage(item.imageUrl),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          int cardIndex = index;
          Color backColor;
          if(item.type=='coffee'){
            backColor=Color(0xFFE8A876);
          }
          else if(item.type=='tea'){
            backColor= Color(0xFF41B3A3);
          }
          else if(item.type=='shake'){
            backColor= Color(0xFFF3B2B7);
          }
          else if(item.type=='juice'){
            backColor= Color(0xFFF76C6C);
          }
          // Navigator.pushNamed(context, DescribedProduct.id,
          //     arguments: {'index': cardIndex});
          Navigator.pushNamed(context, DetailsPage.id,arguments: {'index': cardIndex , 'color':backColor});
        },
      );
    }
    return Container();
  }

}


//in case of gridview use this return statement for getItemWidget
// return GestureDetector(
//       //   child: Container(
//       //     padding: EdgeInsets.only(top: index == null ? 35 : 0),
//       //     margin: EdgeInsets.only(bottom: 2),
//       //     height: index == null ? 240 : 205,
//       //     child: Stack(
//       //       children: <Widget>[
//       //         Container(
//       //           padding:
//       //           EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
//       //           child: Material(
//       //             borderRadius: BorderRadius.only(
//       //               topRight: Radius.circular(20),
//       //               topLeft: Radius.circular(20),
//       //               bottomLeft: Radius.circular(20),
//       //               bottomRight: Radius.circular(20),
//       //             ),
//       //             elevation: 30,
//       //             child: ClipRRect(
//       //               borderRadius: BorderRadius.only(
//       //                 topRight: Radius.circular(20),
//       //                 topLeft: Radius.circular(20),
//       //                 bottomLeft: Radius.circular(20),
//       //                 bottomRight: Radius.circular(20),
//       //               ),
//       //               child: Container(
//       //                 color: Color(0xFFFFF),
//       //                 child: Column(
//       //                   children: <Widget>[
//       //                     Expanded(
//       //                       flex: 7,
//       //                       child: Container(
//       //                         width: double.infinity,
//       //                         padding:
//       //                         EdgeInsets.only(left: 24, right: 24, top: 6),
//       //                         decoration: BoxDecoration(
//       //                           color: Color(0xFFf3f0f1),
//       //                         ),
//       //                         child: Column(
//       //                           crossAxisAlignment: CrossAxisAlignment.start,
//       //                           children: <Widget>[
//       //                             Text(
//       //                               item.name,
//       //                               style: TextStyle(
//       //                                   color: Color(0xFF917264),
//       //                                   fontSize: 22,
//       //                                   fontWeight: FontWeight.bold),
//       //                               overflow: TextOverflow.clip,
//       //                             ),
//       //                             SizedBox(height: 33),
//       //                             Text(
//       //                               item.description1,
//       //                               style: TextStyle(
//       //                                   color: Color(0xFFc8b7af),
//       //                                   fontSize: 15.5),
//       //                               overflow: TextOverflow.clip,
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                     Expanded(
//       //                       flex: 2,
//       //                       child: Container(
//       //                         padding: EdgeInsets.only(left: 18, right: 18),
//       //                         child: Row(
//       //                           crossAxisAlignment: CrossAxisAlignment.center,
//       //                           mainAxisAlignment:
//       //                           MainAxisAlignment.spaceBetween,
//       //                           children: <Widget>[
//       //                             RichText(
//       //                               text: TextSpan(
//       //                                   text: '\$ ',
//       //                                   style: TextStyle(
//       //                                       color: Color(0xFFd39233),
//       //                                       fontSize: 23,
//       //                                       fontWeight: FontWeight.bold),
//       //                                   children: [
//       //                                     TextSpan(
//       //                                       text: item.price.toString(),
//       //                                       style: TextStyle(
//       //                                         color: Colors.black,
//       //                                         fontSize: 23,
//       //                                         fontWeight: FontWeight.w400,
//       //                                       ),
//       //                                     )
//       //                                   ]),
//       //                               overflow: TextOverflow.clip,
//       //                             ),
//       //                             IconButton(
//       //                               icon: Icon(EvaIcons.plusSquareOutline,
//       //                                   color: Colors.brown[400], size: 29),
//       //                               onPressed: () {
//       //                                 Alert(
//       //                                   context: context,
//       //                                   type: AlertType.none,
//       //                                   title: "Done",
//       //                                   desc: "Added to cart",
//       //                                   buttons: [
//       //                                     DialogButton(
//       //                                       child: Text(
//       //                                         "continue",
//       //                                         style: TextStyle(
//       //                                             color: Colors.white,
//       //                                             fontSize: 20),
//       //                                       ),
//       //                                       onPressed: () =>
//       //                                           Navigator.pop(context),
//       //                                       width: 120,
//       //                                       color: Colors.yellow[800],
//       //                                     )
//       //                                   ],
//       //                                 ).show();
//       //                               },
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ],
//       //                 ),
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //         item.featured
//       //             ? Positioned.directional(
//       //             textDirection: TextDirection.ltr,
//       //             start: 170,
//       //             top: 4,
//       //             child: Icon(
//       //               Icons.favorite,
//       //               color: Colors.redAccent,
//       //               size: 35.0,
//       //             ))
//       //             : Container(),
//       //         Positioned.directional(
//       //           textDirection: TextDirection.ltr,
//       //           start: 100,
//       //           top: 50,
//       //           child: Image(
//       //             width: 80,
//       //             height: 90,
//       //             fit: BoxFit.contain,
//       //             image: NetworkImage(item.imageUrl),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       //   onTap: () {
//       //     int cardIndex = index;
//       //     print(cardIndex);
//       //     Navigator.pushNamed(context, DescribedProduct.id,
//       //         arguments: {'index': cardIndex});
//       //   },
//       // );