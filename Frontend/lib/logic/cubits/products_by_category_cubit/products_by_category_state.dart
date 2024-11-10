import 'package:ecommerce/data/models/product/product_model.dart';

abstract class ProductsByCategoryState {
  final List<ProductModel> products;

  ProductsByCategoryState(this.products);
}

class ProductsByCategoryInitialState extends ProductsByCategoryState {
  ProductsByCategoryInitialState() : super([]);
}

class ProductsByCategoryLoadingState extends ProductsByCategoryState {
  ProductsByCategoryLoadingState(super.products);
}

class ProductsByCategoryLoadedState extends ProductsByCategoryState {
  ProductsByCategoryLoadedState(super.products);
}

class ProductsByCategoryErrorState extends ProductsByCategoryState {
  final String errorMessage;

  ProductsByCategoryErrorState(this.errorMessage, super.products);
}
