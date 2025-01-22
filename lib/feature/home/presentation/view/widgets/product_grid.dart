import 'package:elevatetask/core/extentions/screen_size.dart';
import 'package:elevatetask/core/shared_widget/build_shimmer_shape.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/feature/home/presentation/view/widgets/product_card.dart';
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
    BlocProvider.of<HomeCubit>(context).fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var cubit = BlocProvider.of<HomeCubit>(context);

    return BlocConsumer<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        List<ProductModel>? products = cubit.products;

        if (state is ProductsHomeLoadingState && products.isEmpty) {
          return const BuildShimmerShape(width: 100, height: 100);
        }

        if (state is ProductsHomeFaliureState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          );
        }

        if ( state is ProductsHomeSuccessState) {
          return  Wrap(
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

        return const SizedBox();
      },
      listener: (BuildContext context, Object? state) {
        if (state is ProductsHomeFaliureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
  @override
  bool get wantKeepAlive => true; // Preserve the state of this widget
}