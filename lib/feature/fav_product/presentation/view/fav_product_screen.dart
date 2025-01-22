import 'package:elevatetask/feature/fav_product/presentation/view/widgets/fav_product_body.dart';
import 'package:flutter/material.dart';

class FavProductScreen extends StatelessWidget {
  const FavProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavProductBody(),
    );
  }
}
