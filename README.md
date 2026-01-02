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
<img width="300" height="600" alt="Screenshot_1767316895" src="https://github.com/user-attachments/assets/8c8bd826-d5f4-414d-a1ac-d9a79e95f5e0" />
<img width="300" height="600" alt="Screenshot_1767316899" src="https://github.com/user-attachments/assets/cdfb679b-3ef9-40aa-a74d-6cb55a932be3" />
<img width="300" height="600" alt="Screenshot_1767317018" src="https://github.com/user-attachments/assets/f34a39a7-23ca-46f9-90d8-66908dce2d91" />
<img width="300" height="600" alt="Screenshot_1767317033" src="https://github.com/user-attachments/assets/fa95d12c-f22e-4456-9d1e-3bf43f1f87d7" />
<img width="300" height="600" alt="Screenshot_1767317037" src="https://github.com/user-attachments/assets/d60b7add-e2e5-48f5-8c38-f1c76550cd0a" />


### 도전 기능
<img width="300" height="600" alt="Screenshot_1767096529" src="https://github.com/user-attachments/assets/cc8d9a2c-67eb-4791-a59f-75f9d4650268" />
<img width="300" height="600" alt="Screenshot_1767317069" src="https://github.com/user-attachments/assets/726aeb7a-8a04-4376-94ef-498d03dab4a8" />
<img width="300" height="600" alt="Screenshot_1767317046" src="https://github.com/user-attachments/assets/8194a2c4-e82c-4002-bb27-9e87ef3181d8" />

## 3️⃣ Trouble Shooting
#### 주혜림
- cartList의 데이터를 받아와서 관리할 때 장바구니의 리스트가 계속 초기화되는 문제가 발생했습니다.
- 자식위젯에서 함수를 만들고 관리를 하다보니 어떤 부분에서 문제가 생길 때 관리가 힘들게 됩니다.
- 상태관리를 홈페이지(부모)에서 콜백 함수를 만들고 자식위젯이 가져다 쓰게 하도록 해야합니다.

#### 최승현
- SingleChildScrollView안에 있는 위젯들이 그려지지않았습니다.
- 스크롤뷰에서 Row에서 충돌이난다는 걸 알게됬습니다
- Expanded 위젯으로 감싸서 남은 공간을 차지하게 하려 했으나, SingleChildScrollView는 이론적으로 무한한 높이를 가지기 때문에 Expanded가 적용되지 않는 한계를 발견했습니다.
- Expanded가 TextField가 가로의 남은 공간을 채우도록 설정하였습니다.
- SingleChildScrollView가 자식위젯에 세로 뿐만 아니라 가로방향으로도 제약 없는 공간을 제공하려 한다는 특성을 알게되었습니다.

#### 박진
- 상세페이지에서 상품을 장바구니에 담았으나, 다시 홈페이지로 돌아와 장바구니를 확인했을 때 상품 리스트가 비어 있거나 업데이트 되지 않는 문제가 있었습니다. 
- 원인 분석 시에 데이터(장바구니 리스트)가 각 페이지(위젯)마다 별도로 관리되고 있었고, 상세페이지에서 수정된 데이터가 공통 부모 위젯이나 전역 상태에 반영되고 있지 않았습니다.
- 문제 해결은 최상위 부모 위젯인 HomePage에서 관리할 수 있도록 장바구니 리스트를 선언해주고, 상품을 추가하는 함수(addToCart)를 부모 위젯에 정의하여 페이지 이동 시에 함수와 리스트를 파라미터로 전달하여 상세페이지에서 부모의 데이터를 받을 수 있도록 설계하여 해결했습니다.

#### 김영광
- 컴포넌트 간 데이터를 전달하는 과정에서 발생하는 prop drilling에 대해 다시 한번 깊게 생각하게 되었습니다.
- StafulWidget을 사용해 상태를 관리하게 되면, 사용하지 않는 데이터도 하위 또는 상위 위젯의 필요로 의해  전달해줘야 한다는 것을 알게 되었습니다.
- 그렇다고 전역변수로 사용하자니, flutter에서 권장하는 방법이 아닐 뿐더러 최상위 Widget의 setState를 필요로 하기에 비효율적으로 생각되었습니다.
- flutter 팀에서 상태관리 라이브러리를 중요시 생각하는 이유가 뼈저리게 느껴졌으며, 이를 통해 앞으로 하는 프로젝트는 최소한의 StatefulWidget을 사용하도록 노력할 것입니다.
