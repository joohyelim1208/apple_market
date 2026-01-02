import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuantityControlWidget extends StatelessWidget {
  const QuantityControlWidget({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onDecrement, icon: Icon(Icons.remove)),
        Container(
          constraints: BoxConstraints(minWidth: 24, maxWidth: 48),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            quantity.toString(),
            maxLines: 1,
            minFontSize: 10,
            stepGranularity: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
      ],
    );
  }
}
