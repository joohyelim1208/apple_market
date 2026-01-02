import 'package:apple_market/entity/item.dart';
import 'package:apple_market/theme/tokens/app_spacing.dart';
import 'package:apple_market/ui/cart_page/widgets/image_display_widget.dart';
import 'package:apple_market/ui/cart_page/widgets/quantity_control_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CartItmesPage extends StatefulWidget {
  const CartItmesPage({
    super.key,
    required this.cartList,
    required this.onItemDeleted,
  });

  final List<Item> cartList;
  final Function(int) onItemDeleted;

  @override
  State<CartItmesPage> createState() => _CartItmesPageState();
}

class _CartItmesPageState extends State<CartItmesPage> {
  int max = 5;

  @override
  Widget build(BuildContext context) {
    double total = widget.cartList.fold(
      0.0,
      (previousValue, element) =>
          previousValue + element.price * element.quantity,
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: widget.cartList.length,
                itemBuilder: (context, index) => SizedBox(
                  height: 100,
                  child: Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ImageDisplayWidget(item: widget.cartList[index]),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    widget.cartList[index].name,
                                    maxLines: 1,
                                    minFontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    widget.onItemDeleted(index);
                                  },
                                  icon: Icon(Icons.close),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                QuantityControlWidget(
                                  quantity: widget.cartList[index].quantity,
                                  onIncrement: () {
                                    if (widget.cartList[index].quantity < max) {
                                      setState(() {
                                        widget.cartList[index] = widget
                                            .cartList[index]
                                            .copyWith(
                                              quantity:
                                                  widget
                                                      .cartList[index]
                                                      .quantity +
                                                  1,
                                            );
                                      });
                                    } else {
                                      return;
                                    }
                                  },
                                  onDecrement: () {
                                    setState(() {
                                      if (widget.cartList[index].quantity > 1) {
                                        widget.cartList[index] = widget
                                            .cartList[index]
                                            .copyWith(
                                              quantity:
                                                  widget
                                                      .cartList[index]
                                                      .quantity -
                                                  1,
                                            );
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AutoSizeText(
                                      maxLines: 1,
                                      widget.cartList[index].price != 0
                                          ? "${(widget.cartList[index].quantity * widget.cartList[index].price).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} 원"
                                          : "무료 나눔",
                                    ),
                                  ),
                                ),
                                AppSpacing.w12,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Text("최종합계"),
          Container(
            padding: EdgeInsets.only(right: 8),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${total.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} 원",
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("결제하기", style: TextStyle(color: Colors.white)),
          ),

          AppSpacing.h12,
        ],
      ),
    );
  }
}
