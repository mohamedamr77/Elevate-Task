import 'package:flutter/material.dart';

import '../shared_functions/shared_functions.dart';
import '../utils/font_size_responsize.dart';

class GText extends StatelessWidget {
  final Color color;
  final String content;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? enableArabicFont;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final double? decorationThickness;

  const GText({
    super.key,
    required this.color,
    required this.content,
    required this.fontSize,
    this.textDirection,
    this.fontWeight,
    this.textAlign,
    this.enableArabicFont = true,
    this.maxLines,
    this.overflow,
    this.textDecoration,
    this.decorationColor,
    this.decorationThickness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign ?? TextAlign.left,
      textDirection: textDirection ?? TextDirection.ltr,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: getResponsiveFontSize(context: context, fontSize: fontSize),
        overflow: overflow,
        decoration: textDecoration,
        color: color,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        fontFamily: SharedFunctions.determineFontFamily(content),
        fontWeight: fontWeight,
      ),
    );
  }
}
