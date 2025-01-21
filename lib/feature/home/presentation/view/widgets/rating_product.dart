import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';

class RatingProduct extends StatelessWidget {
  const RatingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GText(
            color: AppColors.blueAccent,
            content: "Review (4.6)",
            fontSize: 13,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: 4),
          Icon(
            Icons.star,
            color: Color(0xffFFD800),
            size: 18,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
