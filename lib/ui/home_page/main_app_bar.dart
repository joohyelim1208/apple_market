import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/cart_page/cart_page.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  // 부모에게서 카트리스트를 전달받음
  final List<Item> cartList;

  const MainAppBar({super.key, required this.cartList});

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
        IconButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                // 클래스에서 선언된 변수는 아래 클래스에서 사용할 때 반드시 앞에 위젯을 붙여야 한다!
                builder: (context) => CartPage(cartList: widget.cartList),
              ),
            ).then((value) => setState(() {})); //장바구니에서 돌아왔을 때
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
