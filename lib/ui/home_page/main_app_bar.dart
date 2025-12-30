import 'package:apple_market/ui/cart_page/cart_page.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(64);
}

class _MainAppBarState extends State<MainAppBar> {
  final List items = [];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset("assets/images/AppleMarketLogo.webp", height: 30),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
          //
        ),
        // 카트 아이콘을 누르면 장바구니 페이지로 이동
        IconButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
