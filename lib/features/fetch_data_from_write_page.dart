import 'package:apple_market/entity/item.dart';
import 'package:apple_market/ui/write_page/wtite_page.dart';
import 'package:flutter/material.dart';

Future<Item?> fetchDataFromWritePage(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WritePage()),
  );

  if (result! is Item || result == null || !context.mounted) {
    return null;
  }

  return result;
}
