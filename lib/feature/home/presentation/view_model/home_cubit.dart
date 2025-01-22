import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/feature/home/data/repo/home_repo.dart';
import 'package:elevatetask/feature/home/presentation/view_model/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitialState());
  final HomeRepo homeRepo;
  List<ProductModel> products=[];
  Map<String ,List<ProductModel>> getProductsMap ={};

  fetchProduct()async{
    var result =await homeRepo.getProduct();
    result.fold((error) {
      debugPrint(error.errorMessage);

    emit(ProductsHomeFaliureState(errorMessage: error.errorMessage));
    }, (productsList) {
      products =productsList;
      getProductsMap ={
        "products": products,
      };
      debugPrint(products.toString());
      emit(ProductsHomeSuccessState());
    },);
  }
}
