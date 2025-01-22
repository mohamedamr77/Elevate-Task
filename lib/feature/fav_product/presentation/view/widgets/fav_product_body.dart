import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavProductBody extends StatelessWidget {
  const FavProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavProductCubit>(context);
    return CustomScrollView(
      slivers: [

      ],
    );
  }
}
