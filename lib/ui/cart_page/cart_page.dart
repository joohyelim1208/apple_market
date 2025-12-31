import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/cart_page/cart_empty_page.dart';
import 'package:apple_market/ui/cart_page/cart_itmes_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cartList});

  final List<Item> cartList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC5BF),
        title: Text('장바구니', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: cartList.isEmpty
          ? CartEmptyPage()
          : CartItmesPage(cartList: cartList),
    );
  }
}
