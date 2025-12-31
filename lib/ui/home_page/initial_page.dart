import 'package:apple_market/entity/item.dart';
import 'package:apple_market/features/fetch_data_from_write_page.dart';
import 'package:apple_market/ui/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

/// 상품 리스트가 없을 땐 로고만 보인다.
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  // 예외처리
  double price = 0;
  String priceText = '';

  final List<Item> items = [
    Item(
      imageUrl: "assets/images/airpods.webp",
      name: "에어팟 미개봉 새상품 입니다.",
      price: 120000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/iphone.webp",
      name: "아이폰 판매합니다",
      price: 105000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/ipad.webp",
      name: "중고 아이패드",
      price: 120000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/mac.webp",
      name: "최신형 맥북 에어 입니다.",
      price: 1600000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/vision.webp",
      name: "비젼프로 한번 써보세요",
      price: 99000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/watch.webp",
      name: "방수기능 좋은 에어 워치",
      price: 80000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/airpods.webp",
      name: "맥북 에어 미개봉 새상품 입니다.",
      price: 500000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/iphone.webp",
      name: "아이폰 판매합니다",
      price: 105000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/ipad.webp",
      name: "중고 아이패드",
      price: 120000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/mac.webp",
      name: "최신형 맥북 에어 입니다.",
      price: 1600000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/vision.webp",
      name: "비젼프로 한번 써보세요",
      price: 99000,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/watch.webp",
      name: "방수기능 좋은 에어 워치",
      price: 80000,
      des: "",
      quantity: 1,
    ),
    // 예외 처리
    Item(
      imageUrl: "assets/images/airpods.webp",
      name: "중고 맥북 무료 나눔합니다!",
      price: 0,
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: null,
      name: "등록된 상품이 없습니다.", // 팝업창 띄우기
      price: -1,
      des: "",
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.isEmpty
          ? Center(
              child: Image.asset(
                'assets/images/AppleMarketLogo.webp',
                width: 150,
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return _productListRow(item, context); // 상품리스트 정보 불러오기
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(); // 리스트 별 구분선
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await fetchDataFromWritePage(context);

          if (item != null) {
            setState(() {
              items.add(item);
            });
          }
          return;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/// 상품 리스트
@override
Widget _productListRow(Item item, BuildContext context) {
  // 3가지 예외처리. 1. 가격이 있을 때 / 2. 무료나눔 = 0 / 3. 등록된 상품이 없을 때 -1
  String formatPrice(dynamic price) {
    // 1. 등록된 상품이 없을 때
    if (price == -1) {
      return "가격 미정";
      // 2. 무료나눔 일 때
    } else if (price == 0) {
      return "무료 나눔";
    }
    // 3. 정상 가격일 때. 더블타입인 int의 소수점 제거
    String prices = price.toInt().toString();
    return "${prices.replaceAllMapped(
      //
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )}원";
  }

  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(),
        ), // DetailPage로 연결시킴
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ), // 사진이 들어갈 사이즈와 둥근 모서리를 지정하고, 이미지는 컨테이너 안에 꽉 차게끔 한다.
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: Image.asset(
                // entity 경로로 바꿔주면 해결됨. 변수명 변경해서
                // String 타입의 image를 위젯으로 표시하는 방법
                item.imageUrl!,
                // 리스트타일 ClipRRect 높이가 56 고정값이라 강제로 100 사이즈를 만들기 위해 이미지의 사이즈를 50으로 잡고 2배 스케일을 적용하였다.
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 텍스트 정보가 들어갈 곳
          // sizedBox와 같은 것.
          AppSpacing.w12,
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 리스트에 쓰이는 텍스트의 설정
                  Text(
                    //
                    item.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    // 제목은 최대 2줄 까지만
                    maxLines: 1,
                    // 말줄임표 생략표시기능
                    overflow: TextOverflow.ellipsis,
                    //
                  ),
                  const Spacer(),
                  Row(
                    // 문자열 제일 오른쪽 하단. 가격표
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        // "${item.price}원", 소수점 없애주는 함수 적용해주기
                        "${formatPrice(item.price)}원",
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          formatPrice(item.price),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );
}

// 이미지가 없을 때 예외처리 출력되는 부분
Widget _imagePlaceholder() {
  return Container(
    width: 100,
    height: 100,
    color: Colors.grey[200],
    child: const Icon(Icons.image_not_supported, color: Colors.grey),
  );
}
