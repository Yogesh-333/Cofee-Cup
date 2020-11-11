import 'package:coffee_shop_master_rebuild/product_curd.dart';
import 'package:flutter/material.dart';



class OrderItem extends ChangeNotifier{

  List<OrderItemListMap> orderItemList=[];
  int get orderCount {
    print('order count ${orderItemList.length}');
    return orderItemList.length;
  }
  addOrder(Item item,int sugarQuantity,specialNote){
  final   newOrder=   OrderItemListMap(imageUrl: item.imageUrl , sugarQuantity: sugarQuantity, featured: item.featured,specialNote: specialNote , name: item.name, type: item.type, price: item.price, total: item.price, description1: item.description1, orderQuantity: 1);
  orderItemList.add(newOrder);
  }
  deleteOrder(int index){
    orderItemList.removeAt(index);
    notifyListeners();
  }
  double totalAmount=0;
 intialPrice(double value)
 {
   totalAmount=totalAmount+value;
 }
  void addAmount(double value) {
    //final amount = orderItemList.;
   totalAmount=totalAmount+value;
    notifyListeners();
  }//gets value from + value in order confirmation and increases total amount in checkout
  void subAmount(double value) {
    //final amount = value;
    totalAmount=totalAmount-value;
    notifyListeners();
  }//gets value from - value in order confirmation and decreases total amount in checkout

}

class OrderItemListMap {
  final String imageUrl, name,  description1,specialNote, type;
  final bool featured;
  final int sugarQuantity;
  int orderQuantity;
  final double price,total;

  OrderItemListMap({
    @required this.name,
    @required this.imageUrl,
    @required this.description1,
    @required this.specialNote,
    @required this.sugarQuantity,
    @required this.price,
    @required this.type,
    @required this.orderQuantity,
    @required this.featured,
    @required this.total,
  });
}


