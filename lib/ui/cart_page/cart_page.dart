import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/cart_page/cart_empty_page.dart';
import 'package:apple_market/ui/cart_page/cart_itmes_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.cartList});

  final List<Item> cartList;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _onItemDeleted(int index) {
    setState(() {
      widget.cartList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        print('PopScope');
        Navigator.pop(context, widget.cartList);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFC5BF),
          title: Text('장바구니', style: Theme.of(context).textTheme.titleLarge),
        ),
        body: widget.cartList.isEmpty
            ? CartEmptyPage()
            : CartItmesPage(
                cartList: widget.cartList,
                onItemDeleted: _onItemDeleted,
              ),
      ),
    );
  }
}
