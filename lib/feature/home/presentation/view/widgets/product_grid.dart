import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runSpacing: 0.03.h, // Vertical spacing between rows 
      children: List.generate(
        8,
        (index) => SizedBox(
          width: 0.43.w, // Set width for each item
          child: const ProductCard(),
        ),
      ),
    );
  }
}
