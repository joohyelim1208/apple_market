import 'package:apple_market/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class CartEmptyPage extends StatelessWidget {
  const CartEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100),
          AppSpacing.h8,
          Text("장바구니가 비어있습니다.", style: Theme.of(context).textTheme.bodyMedium),
          AppSpacing.h12,
          ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("쇼핑하러 가기", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
