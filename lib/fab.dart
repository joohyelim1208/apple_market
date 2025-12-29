import 'package:flutter/material.dart';

void navigateToWritePage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => WritePage()));
}
