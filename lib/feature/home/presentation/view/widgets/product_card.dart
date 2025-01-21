import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/fav_button.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/image_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/price_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/rating_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/title_product.dart';
import 'package:flutter/material.dart';
import 'add_to_cart_button.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Product Card Container
        _buildProductCard(),
        // Add to Cart Button
        const AddToCartButton(),
        // Favorite Button
        FavButton(onPressed: () {}, isFav: false)
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: _buildDecorationItem(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Product Image
          const ImageProduct(),
          _buildSpacerWidget(),
          // Product Title
          const TitleProduct(),
          _buildSpacerWidget(),
          // Product Price
          const PriceProduct(),
          // Product Rating
          const RatingProduct(),
          _buildSpacerWidget(height: 16),
        ],
      ),
    );
  }

  Widget _buildSpacerWidget({double? height}) {
    return SizedBox(height: height ?? 8);
  }

  BoxDecoration _buildDecorationItem(){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0.03.w),
      border: Border.all(
        color: const Color(0xffB2C8DD),
        width: 2.5,
      ),
    );
  }
}