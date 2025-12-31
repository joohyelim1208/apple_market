import 'package:apple_market/entity/item.dart';
import 'package:apple_market/features/fetch_data_from_write_page.dart';
import 'package:apple_market/theme/tokens/app_spacing.dart';
import 'package:apple_market/ui/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

// body에 List가 있을 때, 없을 때 로고만 있는 상태를 생각해서 구성
//
class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  // 임시 데이터 리스트. 없으면 로고만 보임.
  // 타이틀 변수가 빠짐
  // 이미지 객체를 만들어서 넣어야 한다. 아니면 이미지를 String으로
  final List<Item> items = [
    Item(
      // 이미지를 위젯으로 불러오는 구조
      imageUrl: "assets/images/airpods.webp",
      name: "맥북 에어 미개봉 새상품 입니다.",
      price: 500000,
      // 내용은 넣지 않아도 됨
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/iphone.webp",
      des: "",
      name: "아이폰 판매합니다",
      price: 105000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/ipad.webp",
      des: "",
      name: "중고 아이패드",
      price: 120000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/mac.webp",
      des: "",
      name: "최신형 맥북 에어 입니다.",
      price: 1600000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/vision.webp",
      des: "",
      name: "비젼프로 한번 써보세요",
      price: 99000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/watch.webp",
      des: "",
      name: "방수기능 좋은 에어 워치",
      price: 80000,
      quantity: 1,
    ),
    Item(
      // 이미지를 위젯으로 불러오는 구조
      imageUrl: "assets/images/airpods.webp",
      name: "맥북 에어 미개봉 새상품 입니다.",
      price: 500000,
      // 내용은 넣지 않아도 됨
      des: "",
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/iphone.webp",
      des: "",
      name: "아이폰 판매합니다",
      price: 105000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/ipad.webp",
      des: "",
      name: "중고 아이패드",
      price: 120000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/mac.webp",
      des: "",
      name: "최신형 맥북 에어 입니다.",
      price: 1600000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/vision.webp",
      des: "",
      name: "비젼프로 한번 써보세요",
      price: 99000,
      quantity: 1,
    ),
    Item(
      imageUrl: "assets/images/watch.webp",
      des: "",
      name: "방수기능 좋은 에어 워치",
      price: 80000,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // 데이터가 없을 때 중앙에 로고를 표시
          items.isEmpty
          ? Center(
              child: Image.asset(
                'assets/images/AppleMarketLogo.webp',
                width: 150,
              ),
            )
          // 리스트 아이템 사이에 구분선이나 간격 추가
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // 아이템 리스트 만큼 출력해줌
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                // 상품리스트에 들어갈 정보를 따로 만들어서 불러오기
                return _productListRow(item, context);
              },
              // 구분선
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
      // 플로팅 액션 버튼. 사이즈. 색상은 지정된 테마
      // writePage로 전환
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 작성페이지로 넘어감. 아이템이 없으면 동작하지 않음
          final item = await fetchDataFromWritePage(context);

          if (item != null) {
            // 데이터가 추가되었음을 알리고 화면을 갱신한다.
            setState(() {
              items.add(item);
            });
          }

          return;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// 상품 리스트
Widget _productListRow(Item item, BuildContext context) {
  // 가격 소수점 없애고'toInt', 문자열로 변환'toString', 정규식으로 1000단위마다 콤마 추가하기
  String formatPrice(double price) {
    return price.toInt().toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  // 페이지 전환을 위해 네이게이터 사용
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        // DetailPage로 연결시킴
        MaterialPageRoute(builder: (context) => DetailPage()),
      );
    },
    // 패딩부분부터 네이게이터 안으로 가지고 옴
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        // 좌측에서 시작
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            // 사진이 들어갈 사이즈와 둥근 모서리를 지정하고, 이미지는 컨테이너 안에 꽉 차게끔 한다.
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: Image.asset(
                // entity 경로로 바꿔주면 해결됨. 변수명 변경해서
                // String 타입의 image를 위젯으로 표시하는 방법
                item.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 텍스트 정보가 들어갈 곳
          // sizedBox와 같은 것.
          AppSpacing.w12,
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 리스트에 쓰이는 텍스트의 설정
                  Text(
                    //
                    item.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    // 제목은 최대 2줄 까지만
                    maxLines: 2,
                    // 말줄임표 생략표시기능
                    overflow: TextOverflow.ellipsis,
                    //
                  ),
                  const Spacer(),
                  Row(
                    // 문자열 제일 오른쪽 하단. 가격표
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        // "${item.price}원", 소수점 없애주는 함수 적용해주기
                        "${formatPrice(item.price)}원",
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
