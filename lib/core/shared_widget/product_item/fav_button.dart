import 'package:elevatetask/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

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
          child: isFav ? AppIcons.favIcon : AppIcons.favBorderIcon,
        ),
      ),
    );
  }
}
