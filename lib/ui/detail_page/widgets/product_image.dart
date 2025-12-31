import 'package:flutter/material.dart';

// 이미지 표시 위젯 함수
// 이미지 URL이 null이거나 비어있으면 빈 위젯 반환
// 이미지 없을 때 기본 로고 표시하도록 설정


Widget productImage(String? imageUrl, {required BoxFit fit}) {
  if (imageUrl == null || imageUrl.isEmpty) {
    return Image.asset('assets/images/AppleMarketLogo.webp');
  }
  return Image.asset(imageUrl, fit: fit);
}
