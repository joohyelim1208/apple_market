import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/AppleMarketLogo.webp", height: 30),
        titleTextStyle: Text(
          "Title",
          style: Theme.of(context).textTheme.titleLarge,
        ).style,
        toolbarHeight: 64,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: [Container()]),
    );
  }
}
