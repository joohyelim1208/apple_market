import 'package:apple_market/ui/home_page/initial_page.dart';
import 'package:apple_market/ui/home_page/main_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(cartList: []),
      body: InitialPage(),
      //
    );
  }
}
