import 'package:dartz/dartz.dart';
import 'package:elevatetask/core/error/faliure.dart';
import 'package:elevatetask/feature/home/data/model/product_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<ProductModel>>> getProduct();
}