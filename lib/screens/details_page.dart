import 'package:coffee_shop_master_rebuild/components/constants.dart';
import 'package:coffee_shop_master_rebuild/screens/orderconfirmationscreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../listitem.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop_master_rebuild/product_curd.dart';
import '../order_curd.dart';
import 'orderconfirmationscreen.dart';

class DetailsPage extends StatefulWidget {
  static const id = 'detailpage';
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute
        .of(context)
        .settings
        .arguments as Map;
    int index=(arguments['index']);
    Color backColor =arguments['color'];
    return Scaffold(
      body: Container(
        child: Consumer<ListItems>(
          builder: (context, itemData, child) {
            Item item =itemData.items[index];
            return   Scaffold(
                backgroundColor: backColor,
                body: ListView(children: [
                  Stack(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height - 20.0,
                          width: MediaQuery.of(context).size.width,
                          color:backColor),
                      Positioned(
                          top: MediaQuery.of(context).size.height / 2,
                          child: Container(
                              height: MediaQuery.of(context).size.height / 2 - 20.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(40.0)),
                                  color: Colors.white))),

                      //Content
                      Positioned(
                          top: MediaQuery.of(context).size.height / 2 + 25.0,
                          left: 15.0,
                          child: Container(
                              height: (MediaQuery.of(context).size.height / 2) - 50.0,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(children: [
                                SizedBox(height: 7.0),
                                Text(
                                  'Preparation time',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF726B68)),
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  '5min',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      color: Color(0xFFC6C4C4)),
                                ),
                                SizedBox(height: 10.0),
                                //This is the line
                                Padding(
                                  padding: const EdgeInsets.only(right: 35.0),
                                  child: Container(
                                    height: 0.5,
                                    color: Color(0xFFC6C4C4),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Ingredients',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF726B68)),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  height: 180,
                                  width: 180,
                                  child: Text(
                                    item.description2,//Detailed description
                                    style: TextStyle(
                                        fontFamily: 'nunito',
                                        fontSize: 14.0,
                                        color: Color(0xFFC6C4C4)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 35.0),
                                  child: Container(
                                    height: 0.5,

                                  ),
                                ),

                                //Line
                                Padding(
                                  padding: const EdgeInsets.only(right:12.0),
                                  child: Center(
                                    child:  SizedBox(
                                      width: 300,
                                      height: 50,

                                      child:  FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50)),
                                        child: Text('Make Order'),
                                        textColor: Colors.white,
                                        color: Color(0xFF473D3A),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) => OrderPopScreen(allColor: backColor,item: item,),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0)
                              ]))),

                      Positioned(
                          top: 25.0,
                          left: 15.0,
                          child: Container(
                              height: 300.0,
                              width: 250.0,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //use a row with crossaxis as end
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(width: 25,),
                                        Container(
                                          width: 180.0,
                                          child: Text(item.name,//Name
                                            style: TextStyle(
                                                fontFamily: 'varela',
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Container(
                                        width: 170.0,
                                        child: Text(item.description1,//Description1
                                            style: TextStyle(
                                                fontFamily: 'nunito',
                                                fontSize: 18.0,
                                                color: Colors.white
                                            )
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          )
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        end: 40,
                        top: 10,
                        child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white
                            ),
                            child: Center(
                                child: Icon(Icons.favorite, size: 28.0,  color: item.featured? Colors.red:null)
                            )
                        ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        start: 60,
                        top: 100,
                        child: Image(
                          width: 400,
                          height: 350,
                          fit: BoxFit.contain,
                          image: NetworkImage(item.imageUrl),
                        ),
                      ),
                    ],
                  )
                ]),
            );
          },
        ),
      ),

    );
  }
}


class OrderPopScreen extends StatefulWidget {
  static const  id='orderplacing';
  OrderPopScreen({this.allColor,this.item});
  final Color allColor;
  final Item item;

  @override
  _OrderPopScreenState createState() => _OrderPopScreenState();
}

class _OrderPopScreenState extends State<OrderPopScreen> {
  int sugarLevel = 150;
  String specialNote;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Text('Place Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          Divider(
            color: Colors.black,
            height: 80,
            thickness: 1,
          ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor:  Color(0XFF263238),
                thumbColor:  widget.allColor,
                overlayColor: Colors.black38,
                thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                value: sugarLevel.toDouble(),
                min: 0,
                max: 250,
                onChanged: (double newValue) {
                  setState(() {
                    sugarLevel = newValue.round();
                  });
                },
              ),
            ),
            Column(
              children: [
                Text(
                  'Sugar Quantitiy',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  color: Color(0xFE8A876),
                  child: RichText(
                    text: TextSpan( text:sugarLevel.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text:' gm',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),),
                    ]
                    ),

                  ),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    specialNote = value;
                  },
                  decoration:
                  KTextFieldDecoration.copyWith(hintText: 'Special Note'),
                ),
              ],

            ),
            Divider(
              height: 50,
              color: Colors.black,
              thickness: 1,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text('ADD'),
                textColor: Colors.white,
                color: Colors.redAccent,
                onPressed:() {Navigator.pop(context);
                Provider.of<OrderItem>(
                    context, listen: false)
                    .addOrder(widget.item,sugarLevel,specialNote);
                Provider.of<OrderItem>(
                    context, listen: false)
                    .intialPrice(widget.item.price);
                  Navigator.pushNamed(context, OrderConfirmation.id);},
                 // Provider.of<TaskData>(context, listen: false ).addTask(taskText);
              ),
            ),
          ],
        ),
      ),
    );
  }
}