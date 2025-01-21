import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String urlImage;
  const ImageProduct({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0.027.w),
        topRight: Radius.circular(0.027.w),
      ),
      child: Image(
        image: AssetImage(urlImage),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
