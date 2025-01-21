import 'package:flutter/material.dart';

import '../navigation/navigation_manager.dart';
import '../utils/font_family.dart';

class SharedFunctions {
  static bool isArabicLocale() {
    Locale currentLocale =
        Localizations.localeOf(NavigationManager.currentContext!);
    return currentLocale.languageCode == 'ar';
  }

  static String currentLocale() {
    Locale currentLocale =
        Localizations.localeOf(NavigationManager.currentContext!);
    return currentLocale.languageCode;
  }

  static Alignment currentAlign() {
    return isArabicLocale() ? Alignment.centerRight : Alignment.centerLeft;
  }

  static TextAlign currentTextAlign() {
    return isArabicLocale() ? TextAlign.right : TextAlign.left;
  }

  static String determineFontFamily(String content) {
    if (SharedFunctions.isArabicLocale() && !containsNumber(content)) {
      return AppFontFamily.cairoFontFamily;
    } else if (isNumeric(content)) {
      return AppFontFamily.cairoFontFamily;
    } else {
      return AppFontFamily.cairoFontFamily;
    }
  }

  static bool containsNumber(String content) {
    return RegExp(r'\d').hasMatch(content);
  }

  static bool isNumeric(String content) {
    try {
      return RegExp(r'^-?\d*\.?\d+$').hasMatch(content);
    } catch (e) {
      return false;
    }
  }
}

class StatusInfo {
  final String text;
  final Color color;

  StatusInfo({required this.text, required this.color});
}
