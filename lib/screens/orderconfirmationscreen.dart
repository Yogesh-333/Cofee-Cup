import 'package:flutter/material.dart';
import 'package:coffee_shop_master_rebuild/order_curd.dart';
import 'package:google_place/google_place.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class OrderConfirmation extends StatefulWidget {
  static const id = 'orderConfirmationPage';
  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OrderItem>(builder: (context, orderData, child) {
        return MaterialApp(
          home: Scaffold(
            bottomNavigationBar: new Container( //// Bottom Naviagtion Bar for check out and Total price
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(child: ListTile(
                    title: Text("Total"),
                    subtitle: Text(orderData.totalAmount.toString()),
                  ),),
                  Expanded(
                    child: MaterialButton(onPressed: () {},
                      child: Text(
                        "Check Out", style: TextStyle(color: Colors.white),),
                      color: Colors.red,),
                  )
                ],
              ),
            ),
            body: ListView(
              children: List.generate(orderData.orderCount, (index) {
                return OrderWidget(index:index,  Item: orderData.orderItemList[index],);
              }),
            ),
          ),
        );
      }),
    );
  }

}
class OrderWidget extends StatefulWidget {
  OrderWidget({@ required this.index,@required this.Item});
  int index;
  OrderItemListMap Item;
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool deleteIcon=false;
  @override
  Widget build(BuildContext context) {
   int index=widget.index;
   OrderItemListMap order=widget.Item;
   //int orderQuantity=widget.Item.orderQuantity;
    return Container(
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

              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  color: Color(0xFFf3f0f1),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
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
                              Row(
                                children: [
                                  SizedBox(
                                    height: 120,
                                    width: 80,
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: NetworkImage(order.imageUrl),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    children: [
                                      Text(order.name),
                                      SizedBox(height: 30,),
                                      Text('Sugar:${order.sugarQuantity} gm'),
                                      SizedBox(height: 10,),
                                      Text('Price: ${order.price}'),
                                    ],
                                  ),
                                  SizedBox(width: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RawMaterialButton(
                                        elevation: 6.0,
                                        child: Icon(MdiIcons.minus,size: 25),
                                        onPressed:  () {
                                          setState(() {
                                            if (widget.Item.orderQuantity<=0){
                                              setState(() {
                                                deleteIcon=true;
                                                widget.Item.orderQuantity=0;
                                              });
                                            }
                                            else{
                                              widget.Item.orderQuantity--;
                                              Provider.of<OrderItem>(
                                                  context, listen: false)
                                                  .subAmount( order.price);
                                            }
                                          });
                                        },
                                        constraints: BoxConstraints.tightFor(
                                          width: 26.0,
                                          height: 26.0,
                                        ),
                                        shape: CircleBorder(),
                                        fillColor: Colors.white,
                                      ),

                                      Container(
                                        color: Color(0xFE8A876),
                                        child: Text(
                                          widget.Item.orderQuantity.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(width: 20,),
                                      RawMaterialButton(
                                        elevation: 6.0,
                                        child: Icon(MdiIcons.plus,size: 25),
                                        onPressed:  () {
                                          setState(() {
                                            if (widget.Item.orderQuantity>=50){
                                              setState(() {
                                                widget.Item.orderQuantity=50;
                                              });
                                            }
                                            else {
                                              deleteIcon=false;
                                              widget.Item.orderQuantity++;
                                              Provider.of<OrderItem>(
                                                  context, listen: false)
                                                  .addAmount(  order.price);
                                            }
                                          });
                                        },
                                        constraints: BoxConstraints.tightFor(
                                          width: 26.0,
                                          height: 26.0,
                                        ),
                                        shape: CircleBorder(),
                                        fillColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
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
          deleteIcon
              ? Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 320,
              bottom: 30,
              child: RaisedButton(
                color: Colors.white,
              elevation: 10,
                shape: CircleBorder(),
                 onPressed: () {
                  setState(() {
                    Provider.of<OrderItem>(context,listen: false).deleteOrder(index);
                  });
                 },
                child: Icon(MdiIcons.deleteOutline,
                color: Colors.amber[800],
                size: 20.0,),
              ))
              : Container(),
        ],
      ),
    );
  }
}




