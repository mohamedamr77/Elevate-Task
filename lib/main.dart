import 'package:elevatetask/core/utils/box_app.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/const_variables.dart';
import 'feature/bottom_nav_bar/presentation/view/bottom_nav_bar_view.dart';
import 'package:device_preview/device_preview.dart';

import 'feature/home/data/model/product_model.dart';
import 'feature/home/data/model/rate_model/rate_model.dart';

void main() async{
  await Hive.initFlutter(); // Initialize Hive for Flutter
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(RatingAdapter());
  await Hive.openBox<ProductModel>(BoxApp.favBox);

  runApp(BlocProvider(
    create: (context) => FavProductCubit(),
    child: const MyApp(),
  ));
}
/*
 runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );

   useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
 */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        wd = constraints.maxWidth;
        ht = constraints.maxHeight;
        return SafeArea(
          child: MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: AppColors.lightGrayColor,
                ),
                scaffoldBackgroundColor: AppColors.lightGrayColor),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationManager.navigationKey,
            routes: AppRouter.routes,
            initialRoute: BottomNavBarView.id,
          ),
        );
      },
    );
  }
}
