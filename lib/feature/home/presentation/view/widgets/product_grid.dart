import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/build_shimmer_shape.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/core/shared_widget/product_item/product_card.dart';
import 'package:elevatetask/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/home_cubit.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() {
    _fetchFavProduct();
    BlocProvider.of<HomeCubit>(context).fetchProduct(
        favList: BlocProvider.of<FavProductCubit>(context).favProductList);
  }

  void _fetchFavProduct() {
    BlocProvider.of<FavProductCubit>(context).fetchFavProduct();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return _buildContent(state);
      },
      listener: (BuildContext context, Object? state) {
        _handleStateChanges(state);
      },
    );
  }

  Widget _buildContent(HomeState state) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    List<ProductModel> products = cubit.products;

    if (state is ProductsHomeLoadingState && products.isEmpty) {
      return _buildLoadingState();
    }

    if (state is ProductsHomeFaliureState) {
      return _buildErrorState(state.errorMessage);
    }

    if (state is ProductsHomeSuccessState) {
      return _buildProductGrid(products);
    }

    return const SizedBox();
  }

  Widget _buildLoadingState() {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runSpacing: 0.03.h,
      children: List.generate(
          8, (index) => BuildShimmerShape(width: 0.44.w, height: 0.3.h)),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildProductGrid(List<ProductModel> products) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runSpacing: 0.03.h, // Vertical spacing between rows
      children: List.generate(
        products.length,
        (index) => SizedBox(
          width: 0.43.w, // Set width for each item
          child: ProductCard(productModel: products[index]),
        ),
      ),
    );
  }

  void _handleStateChanges(Object? state) {
    if (state is ProductsHomeFaliureState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: AppColors.redColor
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true; // Preserve the state of this widget
}