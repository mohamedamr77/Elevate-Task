import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevatetask/core/error/faliure.dart';
import 'package:elevatetask/core/helper/api_service.dart';
import 'package:elevatetask/core/utils/app_api.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';
import 'package:elevatetask/feature/home/data/repo/home_repo.dart';
import 'package:flutter/cupertino.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, List<ProductModel>>> getProduct() async {
    try {
      var result = await apiService.get(endpoint: AppApi.product);


      if (result is List) {
        List<dynamic> productsFromApi = result;
        List<ProductModel> productList = [];
        for (var productJson in productsFromApi) {
          productList.add(ProductModel.fromJson(productJson));
        }

        return right(productList);
      } else {
        throw Exception("Invalid API response format: Expected a list");
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}