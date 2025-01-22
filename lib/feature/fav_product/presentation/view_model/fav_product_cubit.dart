import 'package:bloc/bloc.dart';
import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_state.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/box_app.dart';

class FavProductCubit extends Cubit<FavProductState> {
  FavProductCubit() : super(FavProductInitialState());

  List<ProductModel> favProductList = [];
  var box = Hive.box<ProductModel>(BoxApp.favBox);

  changeFavProductIcon({required ProductModel productModel}) {
    if (!favProductList.any((favProduct) => favProduct.id == productModel.id)) {
      addFavProduct(productModel: productModel);
    } else {
      removeFavProduct(productModel: productModel);
    }
  }

  addFavProduct({required ProductModel productModel}) async {
    productModel.fav = !productModel.fav;
    favProductList.add(productModel);
    box.put("${productModel.id}", productModel);
    emit(FavProductAddState());
  }

  removeFavProduct({required ProductModel productModel}) {
    productModel.fav = !productModel.fav;
    favProductList.remove(productModel);
    box.delete("${productModel.id}");
    emit(FavProductRemoveState());
  }

  fetchFavProduct() {
    favProductList = box.values.toList();
  }
}
