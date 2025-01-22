import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/build_shimmer_shape.dart';
import 'package:elevatetask/core/shared_widget/offliline_body.dart';
import 'package:elevatetask/core/utils/app_colors.dart';
import 'package:elevatetask/core/utils/app_text.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/core/shared_widget/product_item/product_card.dart';
import 'package:elevatetask/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../view_model/home_cubit.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid>
    with AutomaticKeepAliveClientMixin {
  late final HomeCubit homeCubit;
  late final FavProductCubit favProductCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = GetIt.instance<HomeCubit>();
    favProductCubit = GetIt.instance<FavProductCubit>();
    _fetchProducts();
  }

  void _fetchProducts() {
    _fetchFavProduct();
    homeCubit.fetchProduct(favList: favProductCubit.favProductList);
  }

  void _fetchFavProduct() {
    favProductCubit.fetchFavProduct();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: homeCubit,
      builder: (BuildContext context, state) {
        return _buildContent(state);
      },
      listener: (BuildContext context, Object? state) {
        _handleStateChanges(state);
      },
    );
  }

  Widget _buildContent(HomeState state) {
    List<ProductModel> products = homeCubit.products;

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
    return errorMessage == AppText.noInternetConnection
        ? OfflineBody(
            onPressCheckInternet: () {
              // Call the Cubit's fetch method when retry button is pressed
              homeCubit.fetchProduct(
                favList: favProductCubit.favProductList,
              );
            },
          )
        : Center(
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
    /*
    note :
        i use wrap and not use for gridview or sliver grid because in responsive give
        some problem because of use aspect ratio and percentage between
        height and width change between every phone and give overflow
        and design not good
     */
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
            backgroundColor: AppColors.redColor),
      );
    }
  }

  @override
  bool get wantKeepAlive => true; // Preserve the state of this widget
}
