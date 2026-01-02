import 'package:apple_market/entity/item.dart';
import 'package:apple_market/features/fetch_data_from_cart_page.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  // 부모에게서 카트리스트를 전달받음
  final List<Item> cartList;
  final Function(List<Item>) onchange;

  const MainAppBar({super.key, required this.cartList, required this.onchange});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(64);
}

class _MainAppBarState extends State<MainAppBar> {
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
            final result = await fetchDataFromCartPage(
              context,
              widget.cartList,
            );
            print(result);
            if (result != null) {
              setState(() {
                widget.onchange(result);
              });
            }
          },

          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
