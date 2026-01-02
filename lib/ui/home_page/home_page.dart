import 'package:apple_market/entity/item.dart';
import 'package:apple_market/features/fetch_data_from_write_page.dart';
import 'package:apple_market/ui/home_page/main_app_bar.dart';
import 'package:apple_market/ui/home_page/widget/product_list_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 예외처리
  double price = 0;
  String priceText = '';
  // 카트 리스트 아이템 관리 로직 변수 추가
  final List<Item> cartList = [];
  final List<Item> itemList = [];
  // 카트 리스트 상태 업데이트 함수
  void onChangeCartList(List<Item> newItems) {
    setState(() {
      cartList.clear();
      cartList.addAll(newItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(cartList: cartList, onchange: onChangeCartList),
      body: itemList.isEmpty
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
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductListRow(
                  item: itemList[index],
                  cartList: cartList,
                ); // 상품리스트 정보 불러오기
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
              itemList.add(item);
            });
          }
          return;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
