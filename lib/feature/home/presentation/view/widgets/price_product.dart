import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';

class PriceProduct extends StatelessWidget {
  final String price;
  const PriceProduct({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GText(
        color: AppColors.darkBlueColor,
        content: "EGP : $price",
        fontSize: 16,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
