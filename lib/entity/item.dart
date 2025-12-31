

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

// copyWith : 원본 객체를 변경하지 않고 특정 값만 바꾼 새로운 객체를 반환하기 위해 사용
// 복사기 개념인데, 특정 값을 바꾸고 복사할 예정
  Item copyWith({
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
    String? des,
  }) {

// 파라미터 값을 확인 후에 null이라면 원본 객체 값을 사용, 아니면 파라미터 값을 리턴하도록 설정함
    return Item(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      des: des ?? this.des,
      price: price ?? this.price,
    );
  }
}
