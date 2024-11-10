import 'package:ecommerce/data/models/category/category_model..dart';
import 'package:ecommerce/data/models/product/product_model.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:ecommerce/logic/cubits/products_by_category_cubit/products_by_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByCategoryCubit extends Cubit<ProductsByCategoryState>{
  final CategoryModel category;
  ProductByCategoryCubit(this.category):super(ProductsByCategoryInitialState()) {
    _initialize();
  }
  final _productRepository = ProductRepository();

  void _initialize() async{
    emit(ProductsByCategoryLoadingState(state.products));
  try{
      List<ProductModel> products = await _productRepository.fetchProductsByCategory(category.sId!);
      emit(ProductsByCategoryLoadedState(products));
  }catch(ex){
    emit(ProductsByCategoryErrorState(ex.toString(), state.products));
  }
  }
}