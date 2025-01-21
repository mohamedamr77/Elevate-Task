import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GText(
        color: AppColors.darkBlueColor,
        content: "EGP : 1200",
        fontSize: 16,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
