import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle mainTitleStyle() {
  return const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
}

TextStyle largeSectionTitleStyle() {
  return const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );
}

TextStyle mediumSectionTitleStyle(Color color) {
  return TextStyle(fontSize: 21, fontWeight: FontWeight.w600, color: color);
}

TextStyle cardTitleStyle(Color color) {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color);
}

TextStyle cardSubtitleStyle(Color color) {
  return TextStyle(fontSize: 14, color: color);
}

TextStyle cardPriceStyle() {
  return TextStyle(
      fontSize: 22, fontWeight: FontWeight.w500, color: primaryColor);
}
