import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/cart_page/cart_page.dart';
import 'package:flutter/material.dart';

List<Item> cartList = [];

class DetailPageBottomNavigationBar extends StatefulWidget {
  final Item item;
  const DetailPageBottomNavigationBar({super.key, required this.item});

  @override
  State<DetailPageBottomNavigationBar> createState() =>
      _DetailPageBottomNavigationBarState();
}

class _DetailPageBottomNavigationBarState
    extends State<DetailPageBottomNavigationBar> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 150,
      child: Row(
        children: [
          Row(
            children: [
              // 마이너스 버튼
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (count > 1) count--;
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
              ),

              // 수량
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "$count",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),

                // 플러스 버튼
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (count < 5) {
                        // 현재 수량이 5개보다 적은지 확인
                        count++;
                      } else {
                        // ScaffoldMessanger: 앱의 하단에 스낵바
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("최대 구매 수량은 5개 입니다."),
                            duration: Duration(seconds: 2), // 화면에 머무는 시간
                            backgroundColor: Colors.grey[500],
                          ),
                        );
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(width: 15),

          // 장바구니
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Item newItem = widget.item.copyWith(quantity: count);
                Navigator.push(
                  // 장바구니 이동
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartList: cartList),
                  ),
                );
                // 장바구니에 같은 아이템이 담겼을 때, indexWhere(반복문)과 동등연산자 사용해서 수량 추가
                int findIndex = cartList.indexWhere(
                  (product) => product.name == widget.item.name,
                );
                // findIndex (= 내가 찾고 있는 아이템 번호)
                // findIndex가 -1이 아니라면 (= 내가 찾는 상품이 장바구니에 있다면)
                if (findIndex != -1) { 
                  setState(() {
                    // copyWith (= 다른 객체 그대로 사용, 특정 값만 바꿀 수 있음)
                    // 가격: cartList의 번호의 가격 + 가격
                    cartList[findIndex] = cartList[findIndex].copyWith(
                      quantity: cartList[findIndex].quantity + count,
                    );
                  });
                } 
                // findIndex가 -1이라면 (= 내가 찾는 상품이 -1개임, 장바구니에 없음)
                // newItem을 선택한 수량에 맞게 장바구니에 담기
                else {
                  Item newItem = widget.item.copyWith(quantity: count);
                  setState(() {
                    cartList.add(newItem);
                  });
                }
              },
              child: Text(
                "장바구니 담기",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
