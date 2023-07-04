import 'package:flutter/material.dart';

class FontManager {
  static const sFProText = 'SFProText';
  static const sFProDisplay = 'SFProDisplay';
}

TextStyle getSemiBold16TextStyle() {
  return const TextStyle(
      fontFamily: FontManager.sFProText,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF555555));
}

TextStyle getBold16TextStyle() {
  return const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getBold18TextStyle() {
  return const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getToolBarTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 20,
    fontWeight: FontWeight.bold);

TextStyle getBigTextTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 24,
    fontWeight: FontWeight.w900);

TextStyle getOnlyButtonTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 16,
    fontWeight: FontWeight.w900);

TextStyle getChipTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 14,
    fontWeight: FontWeight.w300);

TextStyle getTitleTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 24,
    fontWeight: FontWeight.w700);

TextStyle getTitle2TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 20,
    fontWeight: FontWeight.w500);

TextStyle getHeadline1TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 18,
    fontWeight: FontWeight.w700);

TextStyle getHeadline2TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 16,
    fontWeight: FontWeight.w700);

TextStyle getHeadline3TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 16,
    fontWeight: FontWeight.w500);

TextStyle getHeadline4TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 21,
    fontWeight: FontWeight.w600);

TextStyle getHeadline5TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 15,
    fontWeight: FontWeight.w600);

TextStyle getBody1TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 14,
    fontWeight: FontWeight.w700);

TextStyle getBody2TextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 14,
    fontWeight: FontWeight.w500);

TextStyle getCaptionTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 12,
    fontWeight: FontWeight.w500);

TextStyle getHeaderTextStyle() => const TextStyle(
    fontFamily: FontManager.sFProText,
    fontSize: 18,
    fontWeight: FontWeight.w500);
