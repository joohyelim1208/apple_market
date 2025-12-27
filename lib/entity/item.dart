import 'dart:ui';

class Item {
  Item({
    this.image,
    required this.des,
    required this.name,
    required this.price,
    required this.quantity,
  });

  final String name;
  final double price;
  final int quantity;
  final Image? image;
  final String des;
}
