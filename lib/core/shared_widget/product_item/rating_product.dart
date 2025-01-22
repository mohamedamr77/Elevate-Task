import 'package:elevatetask/core/utils/app_icons.dart';
import 'package:elevatetask/core/utils/app_text.dart';
import 'package:flutter/material.dart';

import '../global_text.dart';
import '../../utils/app_colors.dart';

class RatingProduct extends StatelessWidget {
  final String rate;
  const RatingProduct({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildReviewText(),
          const SizedBox(width: 4),
           AppIcons.starIcon,
          const Spacer(),
        ],
      ),
    );
  }
  Widget _buildReviewText(){
    return GText(
      color: AppColors.blueAccent,
      content: "${AppText.review} ($rate)",
      fontSize: 13,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
