import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/fav_button.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/image_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/price_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/rating_product.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/title_product.dart';
import 'package:flutter/material.dart';
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
        // Product Card Container
        _buildProductCard(productModel: productModel),
        // Add to Cart Button
        AddToCartButton(
          onTap: () {},
        ),
        // Favorite Button
        FavButton(onPressed: () {}, isFav: false)
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
        color: const Color(0xffB2C8DD),
        width: 2.5,
      ),
    );
  }
}
