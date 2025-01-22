import 'package:flutter/material.dart';

import '../global_text.dart';
import '../../utils/app_colors.dart';

class TitleProduct extends StatelessWidget {
  final String title;
  const TitleProduct({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 40,
        child: Center(
          child: GText(
            color: AppColors.primaryColor,
            content: title,
            fontSize: 16,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
