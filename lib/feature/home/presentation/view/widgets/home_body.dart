import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/global_text.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/product_grid.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child:  CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ProductGrid(),
            ),
          ),
        ],
      ),
    );
  }
}
