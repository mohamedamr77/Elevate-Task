import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/global_text.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/fav_button.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/image_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/rating_product.dart';
import 'package:flutter/material.dart';

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
        _buildAddToCartButton(),
        // Favorite Button
        FavButton(onPressed: () {}, isFav: false)
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.03.w),
        border: Border.all(
          color: const Color(0xffB2C8DD),
          width: 2.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Product Image
          const ImageProduct(),
          _buildSpacerWidget(),
          // Product Title
          _buildProductTitle(),
          _buildSpacerWidget(),
          // Product Price
          _buildProductPrice(),
          // Product Rating
          const RatingProduct(),
          _buildSpacerWidget(height: 16),
        ],
      ),
    );
  }

  Widget _buildProductTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GText(
        color: AppColors.primaryColor,
        content: "Nike Air NikeNike Air Nike Nike Air Nike   Air Nike Nike Air Nike  ",
        fontSize: 16,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildProductPrice() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GText(
        color: AppColors.darkBlueColor,
        content: "EGP : 1200",
        fontSize: 16,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {},
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xff004087),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildSpacerWidget({double? height}) {
    return SizedBox(height: height ?? 8);
  }
}