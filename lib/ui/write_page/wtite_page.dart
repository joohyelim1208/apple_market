import 'package:apple_market/entity/item.dart';
import 'package:apple_market/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  //수량 초가값및 텍스트 컨트롤러 상품명,가격,세부사항

  List<Item> items = [];
  int quantity = 1;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  //입력하지않을때
  bool isTitleValid = false;
  bool isPriceValid = false;
  bool isDetailValid = false;
  //사진아이콘 선택시
  List<String> myImages = [
    'assets/images/airpods.webp',
    'assets/images/ipad.webp',
    'assets/images/AppleMarketLogo.webp',
  ];

  List<String> selectorImages = [];
  //함수에 인데스를 넣어 인트인걸 인지 시킴
  void addimages(int index) {
    setState(() {
      selectorImages.add(myImages[index]);
    });
  }

  //입력할때 마다 그림을 그러주는 함수
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
            //사진추가버튼
            Row(
              children: [
                if (selectorImages.length < 10)
                  IconButton(
                    icon: const Icon(Icons.add_a_photo_outlined),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: myImages.length, // 갖고 있는 전체 이미지 개수
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // 2. 여기서 선택한 번호(index)를 함수에 던져줌
                                    addimages(index);
                                    Navigator.pop(context); // 창 닫기
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      myImages[index],
                                      width: 200,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                Text("${selectorImages.length}/10"),
                Expanded(
                  // Row 안에서 남은 공간을 확보
                  child: SizedBox(
                    height: 100, // 사진들이 그려질 높이 제한
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // 가로 스크롤 설정
                      itemCount: selectorImages.length, // 리스트의 개수만큼 생성
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            selectorImages[index], // 리스트에서 번호(index)에 맞는 사진 꺼내기
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
                    //키보드 숫자만 나오게 해줍니다
                    keyboardType: TextInputType.number,
                    //키보드 입력시 숫자만 나오는 필터
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                    decoration: InputDecoration(hintText: '가격을 입력하세요'),
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

            if (isTitleValid &&
                isPriceValid &&
                isDetailValid &&
                selectorImages.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  final item = Item(
                    des: detailController.text,
                    name: nameController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    quantity: quantity,
                    imageUrl: selectorImages[0],
                  );
                  Navigator.pop(context, item);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(370, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("등록하기"),
              )
            else
              ElevatedButton(
                onPressed: () {
                  null;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(370, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("등록하기"),
              ),
          ],
        ),
      ),
    );
  }
}
