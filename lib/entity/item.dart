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

  Item copyWith({
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
    String? des,
  }) {
    return Item(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      des: des ?? this.des,
    );
  }
}
