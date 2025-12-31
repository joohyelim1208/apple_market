import 'package:apple_market/entity/item.dart';
import 'package:apple_market/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  int quantity = 1;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  bool isTitleValid = false;
  bool isPriceValid = false;
  bool isDetailValid = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      if (nameController.text.trim().isEmpty) {
        setState(() {
          isTitleValid = false;
        });
      } else {
        setState(() {
          isTitleValid = true;
        });
      }
    });
    priceController.addListener(() {
      if (priceController.text.trim().isEmpty) {
        setState(() {
          isPriceValid = false;
        });
      } else {
        setState(() {
          isPriceValid = true;
        });
      }
    });
    detailController.addListener(() {
      if (detailController.text.trim().isEmpty) {
        setState(() {
          isDetailValid = false;
        });
      } else {
        setState(() {
          isDetailValid = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품등록'),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.add_a_photo_outlined),
              onPressed: () {},
            ),
            Text("상품명", style: Theme.of(context).textTheme.titleMedium),

            TextField(
              controller: nameController,

              decoration: InputDecoration(hintText: '상품명을 입력하세요'),
            ),

            Text("가격", style: Theme.of(context).textTheme.titleMedium),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    controller: priceController,

                    decoration: InputDecoration(hintText: '가격명을 입력하세요'),
                  ),
                ),
                AppSpacing.w12,

                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            Text("상세정보", style: Theme.of(context).textTheme.titleMedium),
            TextField(
              controller: detailController,

              keyboardType: TextInputType.multiline,
              maxLines: 15,
              maxLength: 500,
              decoration: InputDecoration(hintText: '상세정보를 자세히 입력하세요'),
            ),

            if (isTitleValid && isPriceValid && isDetailValid)
              GestureDetector(
                onTap: () {
                  final item = Item(
                    des: detailController.text,
                    name: nameController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    quantity: quantity,
                  );

                  Navigator.pop(context, item);
                },

                child: Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9E9E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "등록하기",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: () {
                  null;
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check, color: Colors.white),
                      SizedBox(width: 8),
                      Text("등록하기"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
