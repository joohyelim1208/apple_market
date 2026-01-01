import 'package:apple_market/entity/item.dart';
import 'package:apple_market/features/fetch_data_from_write_page.dart';
import 'package:apple_market/ui/home_page/widget/product_list_row.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  // 예외처리
  double price = 0;
  String priceText = '';
  // 카드 리스트 아이템 관리 로직 변수 추가
  final List<Item> cartList = [];
  final List<Item> items = [
    // Item(
    //   imageUrl: "assets/images/airpods.webp",
    //   name: "에어팟 미개봉 새상품 입니다.",
    //   price: 120000,
    //   des: "",
    //   quantity: 1,
    // ),
    // Item(
    //   imageUrl: "assets/images/iphone.webp",
    //   name: "아이폰 판매합니다",
    //   price: 105000,
    //   des: "",
    //   quantity: 1,
    // ),
    // Item(
    //   imageUrl: "assets/images/ipad.webp",
    //   name: "중고 아이패드",
    //   price: 120000,
    //   des: "",
    //   quantity: 1,
    // ),
    // Item(
    //   imageUrl: "assets/images/mac.webp",
    //   name: "최신형 맥북 에어 입니다.",
    //   price: 1600000,
    //   des: "",
    //   quantity: 1,
    // ),

    // // 예외 처리
    // Item(
    //   imageUrl: "assets/images/airpods.webp",
    //   name: "중고 맥북 무료 나눔합니다!",
    //   price: 0,
    //   des: "",
    //   quantity: 1,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.isEmpty
          ? Center(
              // 컬럼 폭은 자식 위젯들의 크기에 맞춰지기 때문에 중앙에 배치되려면 Center위젯 사용
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/AppleMarketLogo.webp', width: 300),
                  const SizedBox(height: 20),
                  Text(
                    "등록된 상품이 없습니다.\n하단의 버튼을 눌러 상품을 등록해주세요",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return productListRow(item, context, cartList); // 상품리스트 정보 불러오기
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
