import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/detail_page/widgets/detail_page_bottom_bar.dart';
import 'package:apple_market/ui/detail_page/widgets/product_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // initial_page.dart에서 데이터 받기 위한 변수
  final Item item;
  final List<Item> cartList;
  const DetailPage({super.key, required this.item, required this.cartList});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void addItem(Item newItem) {
    widget.cartList.add(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title", style: Theme.of(context).textTheme.titleLarge),
        toolbarHeight: 64,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          productImage(widget.item.imageUrl, fit: BoxFit.cover),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상품명
                Text("상품이름", style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.item.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 8),

                // 가격
                Text("상품가격", style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.item.price.toInt().toString().replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',')}원",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 16),

                // 설명
                Text("상세설명", style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    widget.item.des,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // bottom Widget으로 빼서 관리
      bottomNavigationBar: DetailPageBottomBar(
        item: widget.item,
        cartList: widget.cartList,
        addItem: addItem,
      ),
    );
  }
}
