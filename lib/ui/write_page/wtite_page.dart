import 'package:apple_market/entity/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  int quantity = 1;
  List<Item> itemList = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),

        toolbarHeight: 64,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Title', style: Theme.of(context).textTheme.headlineLarge),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.add_a_photo_outlined),
                onPressed: () {
                  print("사진 추가 클릭됨");
                },
              ),
              Text("상품명", style: Theme.of(context).textTheme.titleMedium),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: nameController,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '상품명을 입력하세요',
                  ),
                ),
              ),
              Text("가격", style: Theme.of(context).textTheme.titleMedium),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: priceController,
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '가격명을 입력하세요',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                          Text(
                            '$quantity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Text("상세정보", style: Theme.of(context).textTheme.titleMedium),
              Container(
                height: 340,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: detailController,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '상세정보를 자세히 입력하세요',
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Item newItem = Item(
                    name: nameController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    quantity: quantity,
                    des: detailController.text,
                    image: null,
                  );
                  setState(() {
                    itemList.add(newItem);
                  });
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
