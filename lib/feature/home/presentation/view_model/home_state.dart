abstract class HomeState {}

class HomeInitialState extends HomeState {}

class ProductsHomeLoadingState extends HomeState {}

class ProductsHomeSuccessState extends HomeState {}

class ProductsHomeFaliureState extends HomeState {
  final String errorMessage;
  ProductsHomeFaliureState({required this.errorMessage});
}

class HomeRebuildState extends HomeState {}
