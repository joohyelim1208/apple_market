import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/cart_page/widgets/image_display_widget.dart';
import 'package:apple_market/ui/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

/// 상품 리스트
@override
Widget productListRow(Item item, BuildContext context, List<Item> cartList) {
  // 2가지 예외처리. 1. 가격이 있을 때 / 2. 무료나눔 = 0
  String formatPrice(dynamic price) {
    if (price == 0) {
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

  return ListTile(
    style: ListTileStyle.list,
    // contentPadding: Theme.of(context).listTileTheme.contentPadding,
    tileColor: Theme.of(context).listTileTheme.tileColor,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage(item: item, cartList: cartList,)),
      );
    },
    leading: SizedBox(
      width: 50,
      height: 50,
      child: Transform.scale(
        // 위젯 적용. 리스트타일에 값을 주기 위해 스케일 값이 별도 들어감
        scale: 2,
        child: ImageDisplayWidget(item: item),
      ),
    ),

    title: Row(
      children: [
        SizedBox(width: 20),
        Expanded(
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
