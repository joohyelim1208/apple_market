import 'package:apple_market/entity/item.dart';
import 'package:flutter/material.dart';

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
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Item newItem = widget.item.copyWith(quantity: count);
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
