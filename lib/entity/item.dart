class Item {
  Item({
    this.imageUrl,
    required this.des,
    required this.name,
    required this.price,
    required this.quantity,
  });

  final String name;
  final double price;
  final int quantity;
  final String? imageUrl;
  final String des;
}
