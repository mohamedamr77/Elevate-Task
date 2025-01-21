import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import 'bottom_nav_icon_with_label.dart';

List<BottomNavIconWithLabel> bottomNavIconsList = [
  BottomNavIconWithLabel(
      label: 'Home',
      iconSelected: const Icon(Icons.home,color: AppColors.skyBlueColor,),
      iconUnSelected: const Icon(Icons.home_outlined,color: AppColors.primaryColor,)
  ),
  BottomNavIconWithLabel(
    label: 'favorite',
    iconSelected:
    const Icon(Icons.favorite,color: AppColors.skyBlueColor,),
    iconUnSelected:
    const Icon(Icons.favorite_border_outlined,color: AppColors.primaryColor,),
  ),
];