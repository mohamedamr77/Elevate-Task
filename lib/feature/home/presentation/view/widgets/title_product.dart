import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';

class TitleProduct extends StatelessWidget {
  const TitleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GText(
        color: AppColors.primaryColor,
        content: "Nike Air NikeNike Air Nike Nike Air Nike   Air Nike Nike Air Nike  ",
        fontSize: 16,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
