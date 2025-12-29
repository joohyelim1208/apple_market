import 'package:apple_market/entity/item.dart';
import 'package:flutter/material.dart';

void addItem(
  String name,
  double price,
  String des,
  int quantity,
  BuildContext context,
) {
  final item = Item(des: des, name: name, price: price, quantity: quantity);

  Navigator.pop(context, item);
}
