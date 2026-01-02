import 'package:apple_market/entity/item.dart';
import 'package:flutter/material.dart';

class ImageDisplayWidget extends StatelessWidget {
  const ImageDisplayWidget({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return item.imageUrl != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(item.imageUrl!, fit: BoxFit.cover),
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.no_photography),
          );
  }
}
