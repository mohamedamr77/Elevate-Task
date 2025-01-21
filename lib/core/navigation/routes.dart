import 'package:flutter/material.dart';

import '../../feature/bottom_nav_bar/presentation/view/bottom_nav_bar_view.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    BottomNavBarView.id: (context) => const BottomNavBarView(),

  };
}
