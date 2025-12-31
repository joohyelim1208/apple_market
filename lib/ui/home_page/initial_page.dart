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

  // 디자인에 맞춘 리스트를 만들때는 Row Column쓰는게 낫다
  // 원하는 디자인으로 리스트타일을 맞춘거라 기종에 따라 출력되는 부분이 다를 수 있다.
  // Column을 사용했다가 ListTile을 사용하는 방식을 사용해보았습니다. 리딩 부분의 문제가 있어서 해결하는 방법도 배웠습니다.
  return ListTile(
    style: ListTileStyle.list,
    // contentPadding: Theme.of(context).listTileTheme.contentPadding,
    tileColor: Theme.of(context).listTileTheme.tileColor,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(item: item,),
        ), // 아직 브랜치 합치기 전이라 비워둠
      );
    },
    // 강제로 늘림
    leading: Transform.scale(
      // 높이값 2배 곱한 것
      scale: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: item.imageUrl != null
            ? Image.asset(
                item.imageUrl!,
                // 리스트타일 ClipRRect 높이가 56 고정값이라 강제로 100 사이즈를 만들기 위해 이미지의 사이즈를 50으로 잡고 2배 스케일을 적용하였다.
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                // 이미지가 없을 시 예외처리
                errorBuilder: (context, error, stackTrace) =>
                    _imagePlaceholder(),
              )
            : _imagePlaceholder(),
      ),
    ),

    title: Row(
      children: [
        SizedBox(width: 20),
        Expanded(
          //
          child: Text(
            item.name,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
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
    width: 50,
    height: 50,
    color: Colors.grey[200],
    child: const Icon(Icons.image_not_supported, color: Colors.grey),
  );
}