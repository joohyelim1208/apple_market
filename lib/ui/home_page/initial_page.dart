import 'package:apple_market/entity/item.dart';
import 'package:apple_market/features/fetch_data_from_write_page.dart';
import 'package:flutter/material.dart';

// body에 List가 있을 때, 없을 때 로고만 있는 상태를 생각해서 구성
//
class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시 데이터 리스트. 없으면 로고만 보임
    final List<Item> items = [];

    return Scaffold(
      body:
          // 데이터가 없을 때 중앙에 로고를 표시
          items.isEmpty
          ? Center(
              child: Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/images/AppleMarketLogo.webp',
                  width: 150,
                ),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(items[index].name));
              },
            ),
      // 플로팅 액션 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await fetchDataFromWritePage(context);
          if (item != null) {
            items.add(item);
          }

          return;
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
