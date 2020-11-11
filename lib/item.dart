import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String imageUrl, name, price, description1, description2, type;
  bool featured;

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    final itemName = data['name'];
    final itemDescription1 = data['description1'];
    final itemDescription2 = data['description2'];
    final itemPrice = data['price'].toString();
    final itemImageUrl = data['imageurl'];
    final itemType =data['type'];
    final itemFeatured = data['featured'];
  }
}