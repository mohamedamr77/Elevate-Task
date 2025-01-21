import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class FavButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isFav;

  const FavButton({
    super.key,
    required this.onPressed,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: IconButton(
        onPressed: onPressed,
        icon: CircleAvatar(
          backgroundColor: AppColors.secondaryColor,
          child: Icon(
            isFav ? Icons.favorite_border : Icons.favorite,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
