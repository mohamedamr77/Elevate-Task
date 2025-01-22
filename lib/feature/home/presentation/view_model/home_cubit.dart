import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo/home_implement.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  final homeRepo = getIt<HomeRepoImplement>();
  List<ProductModel> products = [];

  fetchProduct({required List<ProductModel> favList}) async {
    emit(ProductsHomeLoadingState());
    var result = await homeRepo.getProduct();
    result.fold(
      (error) {
        debugPrint(error.errorMessage);

        emit(ProductsHomeFaliureState(errorMessage: error.errorMessage));
      },
      (success) {
        products = success;

        products = products.map((product) {
          if (favList.any((ProductModel favItem) => favItem.id == product.id)) {
            product.fav = true; // Assuming you have a `isNewsMarked` field
          }
          return product;
        }).toList();

        debugPrint(products.toString());
        emit(ProductsHomeSuccessState());
      },
    );
  }
}
