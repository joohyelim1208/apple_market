import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/cart_page/cart_itmes_page.dart';
import 'package:flutter/material.dart';

Future<List<Item>?> fetchDataFromWritePage(
  BuildContext context,
  List<Item> cartList,
) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CartItmesPage(cartList: cartList)),
  );

  if (result is! List<Item> || !context.mounted) {
    return null;
  }

  return result;
}
