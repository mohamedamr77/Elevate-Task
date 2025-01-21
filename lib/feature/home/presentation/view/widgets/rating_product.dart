import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';

class RatingProduct extends StatelessWidget {
  final String rate;
  const RatingProduct({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GText(
            color: AppColors.blueAccent,
            content: "Review ($rate)",
            fontSize: 13,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.star,
            color: Color(0xffFFD800),
            size: 18,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
