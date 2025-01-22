import 'package:flutter/material.dart';

import '../../feature/bottom_nav_bar/presentation/view/bottom_nav_bar_view.dart';
import '../../feature/home/presentation/view/home_view.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    BottomNavBarView.id: (context) => const BottomNavBarView(),
    HomeView.id: (context) => const HomeView(),
  };
}
