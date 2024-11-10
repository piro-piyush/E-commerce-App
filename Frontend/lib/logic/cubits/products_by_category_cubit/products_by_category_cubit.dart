import 'package:ecommerce/data/models/category/category_model..dart';
import 'package:ecommerce/logic/cubits/products_by_category_cubit/products_by_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByCategoryCubit extends Cubit<ProductsByCategoryState>{
  final CategoryModel category;
  ProductByCategoryCubit(this.category):super(ProductsByCategoryInitialState()) {
    _initialize();
  }
  void _initialize(){

  }
}