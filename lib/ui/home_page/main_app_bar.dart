import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

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
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
          //
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}
