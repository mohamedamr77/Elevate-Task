import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/global_text.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavProductBody extends StatelessWidget {
  const FavProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavProductCubit>(context);
    return BlocBuilder<FavProductCubit, FavProductState>(
      builder: (context, state) {
        return cubit.favProductList.isEmpty
            ?  _buildEmptyView()
            : const CustomScrollView(slivers: [],);
      },
    );
  }
  Widget _buildEmptyView(){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/favEmpty.jpg",
              height: 0.6.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16,),
            const GText(
                color: AppColors.primaryColor,
                content: "No Favourite Items", fontSize: 18)
          ],)
    );
  }
}
