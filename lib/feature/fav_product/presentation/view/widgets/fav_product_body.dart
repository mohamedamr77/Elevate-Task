import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/global_text.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_state.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_widget/product_item/product_card.dart';

class FavProductBody extends StatelessWidget {
  const FavProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavProductCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<FavProductCubit, FavProductState>(
        builder: (context, state) {
          List<ProductModel> favProducts = cubit.favProductList;
          return favProducts.isEmpty
              ?  _buildEmptyView()
              :  _buildFavList(favProducts: favProducts);
        },
      ),
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
  Widget _buildFavList({required List<ProductModel> favProducts}){
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 0.03.h, // Vertical spacing between rows
            children: List.generate(
              favProducts.length,
                  (index) => SizedBox(
                width: 0.43.w, // Set width for each item
                child: ProductCard(productModel: favProducts[index]),
              ),
            ),
          )
      )
    ],);
  }
}
