import 'package:elevatetask/core/utils/app_text.dart';
import 'package:flutter/material.dart';

import '../global_text.dart';
import '../../utils/app_colors.dart';

class PriceProduct extends StatelessWidget {
  final String price;
  const PriceProduct({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GText(
        color: AppColors.darkBlueColor,
        content: "${AppText.egp} : $price",
        fontSize: 16,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
