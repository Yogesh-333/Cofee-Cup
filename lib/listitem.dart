import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'product_curd.dart';


class ListItems  extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  List<Item> _items = [];

  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

   getItem(ListItems listitems) async {
     List<Item> _itemsdummy = [];
    final itemValue = await _firestore.collection('itemlist').get();
    for (var document in itemValue.docs) {
      final itemName = document.data()['name'];
      final itemDescription1 = document.data()['description1'];
      final itemDescription2 = document.data()['description2'];
      final itemPrice = document.data()['price'];
      final itemImageUrl = document.data()['imageurl'];
      final itemType = document.data()['type'];
      final itemFeatured = document.data()['featured'];
      final itemWidget = Item(
        name: itemName,
        description1: itemDescription1,
        description2: itemDescription2,
        price: itemPrice,
        imageUrl: itemImageUrl,
        type: itemType,
        featured: itemFeatured,
      );
      print('itemwidget $itemWidget');
      _itemsdummy.add(itemWidget);
      _items=_itemsdummy;
    }
  notifyListeners();
  }



  int get itemCount {
    print('item count ${_items.length}');
    return _items.length;
  }

  bool addItem(String name,
      String description1,
      String description2,
      double price,
      bool featured,
      String type, String url) {
    if (name != null &&
        description2 != null &&
        description1 != null &&
        price != null &&
        type != null) {
      _firestore
          .collection('itemlist')
          .add({
        'name': name,
        'description1': description1,
        'description2': description2,
        'price': price,
        'type': type,
        'featured': featured,
        'imageurl': url,
      });
      notifyListeners();
    }
    return true;
  }
}