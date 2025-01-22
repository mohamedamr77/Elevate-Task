import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';

class AddToCartButton extends StatelessWidget {
  final void Function() onTap;
  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: GestureDetector(
        onTap: onTap,
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primaryColor,
          child: AppIcons.addIcon,
        ),
      ),
    );
  }
}
