import 'package:apple_market/entity/item.dart';
import 'package:apple_market/theme/app_theme.dart';
import 'package:apple_market/ui/cart_page/cart_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppleMarket',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // home: CartEmptyPage(),
      home: CartPage(
        cartList: [
          Item(des: "123", name: "1234", price: 10000, quantity: 2),
          Item(des: "1", name: "1", price: 1000, quantity: 5),
        ],
      ),
    );
  }
}
