import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_state.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/core/shared_widget/product_item/fav_button.dart';
import 'package:elevatetask/core/shared_widget/product_item/image_product.dart';
import 'package:elevatetask/core/shared_widget/product_item/price_product.dart';
import 'package:elevatetask/core/shared_widget/product_item/rating_product.dart';
import 'package:elevatetask/core/shared_widget/product_item/title_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProductCard(productModel: productModel),
        AddToCartButton(
          onTap: () {},
        ),
        _buildFavButton(context: context),
      ],
    );
  }

  Widget _buildProductCard({required ProductModel productModel}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: _buildDecorationItem(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Product Image
          ImageProduct(
            urlImage: productModel.image,
          ),
          _buildSpacerWidget(),
          // Product Title
          TitleProduct(title: productModel.title),
          _buildSpacerWidget(),
          // Product Price
          PriceProduct(
            price: productModel.price.toString(),
          ),
          // Product Rating
          RatingProduct(
            rate: productModel.rating.rate.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildSpacerWidget({double? height}) {
    return SizedBox(height: height ?? 8);
  }

  BoxDecoration _buildDecorationItem() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0.03.w),
      border: Border.all(
        color: AppColors.borderColor,
        width: 2.5,
      ),
    );
  }

  _buildFavButton({required BuildContext context}) {
    return BlocBuilder<FavProductCubit, FavProductState>(
      builder: (context, state) {
        return FavButton(
            onPressed: () {
              BlocProvider.of<FavProductCubit>(context)
                  .changeFavProductIcon(productModel: productModel);
            },
            isFav: productModel.fav);
      },
    );
  }
}
