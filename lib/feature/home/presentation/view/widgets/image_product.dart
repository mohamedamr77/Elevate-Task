import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0.027.w),
        topRight: Radius.circular(0.027.w),
      ),
      child: const Image(
        image: AssetImage("assets/images/clothestest.jpeg"),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
