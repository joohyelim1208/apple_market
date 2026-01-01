# 🔎 Team Project - AppleMarket App

## 1️⃣ 프로그래밍 요구사항

### Item Entity 정의
```dart
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

```

### 1. 상품 목록 페이지 만들기
   - appBar : title logo
   - 상품 목록화면 : 상품 Item(이름, 가격, 이미지) 출력
   - 상품 onTap : DetailPage 이동
   - 상품 등록 버튼 : onPressed -> WritePage
### 2. 상품 상세페이지 만들기
   - appBar : title Text, leading iconButton(뒤로가기)
   - 상품 목록에서 클릭한 상품의 상세 페이지
   - add, remove iconButton을 통해 구매 수량 조절
   - 장바구니 담기 Button 클릭 시, List에 해당 품목 추가
### 3. 상품 등록페이지 만들기
   - appBar : title Text, leading iconButton(뒤로가기)
   - 이미지 선택 버튼 클릭 시, 이미지 팝업 표시
   - 상품명, 상품 가격, 상품 설명창에 입력 가능
   - 등록하기 버튼을 누르면 "등록 완료" 팝업 표시
   - 올바른 입력이 되지 않았을 때, 버튼 비활성화
### 4. 상품 등록과 데이터 연결
   - 상품을 등록하면 HomePage에 상품 출력
### 5. 장바구니 페이지 만들기
   - DetailPage에서 장바구니에 담기 클릭 시 팝업 표시
   - 장바구니 item의 X button 클릭 시, 해당 물품 삭제

## 2️⃣ 구현



### 도전 기능
