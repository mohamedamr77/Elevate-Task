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

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchProduct();
  }
  @override
  Widget build(BuildContext context) {
    var cubit =     BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        List<ProductModel> products = cubit.products;

        if (state is ProductsHomeLoadingState) {
          return BuildShimmerShape(width: 0.5.w, height: 0.4.h);
        }

        if (state is ProductsHomeSuccessState) {
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

        if (state is ProductsHomeFaliureState) {
          // Display an error message or widget
          return Center(
            child: Text(
              state.errorMessage, // Display the error message from the state
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          );
        }

        // Default fallback widget
        return const SizedBox();
      },
      listener: (BuildContext context, Object? state) {
        // Optional: Add a listener to handle side effects (e.g., show a snackbar)
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
}
