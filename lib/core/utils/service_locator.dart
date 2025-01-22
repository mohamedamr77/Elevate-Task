import 'package:elevatetask/feature/fav_product/presentation/view_model/fav_product_cubit.dart';
import 'package:elevatetask/feature/home/data/repo/home_implement.dart';
import 'package:elevatetask/feature/home/presentation/view_model/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../helper/api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepoImplement>((HomeRepoImplement(
    apiService: getIt<ApiService>(),
  )));
  getIt.registerLazySingleton(() => FavProductCubit());
  getIt.registerLazySingleton(() => HomeCubit());
}
