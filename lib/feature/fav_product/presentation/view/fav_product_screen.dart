import 'package:elevatetask/feature/fav_product/presentation/view/widgets/fav_product_body.dart';
import 'package:flutter/material.dart';

class FavProductScreen extends StatelessWidget {
  static const String id = "fav_product_screen";
  const FavProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FavProductBody(),
    );
  }
}
