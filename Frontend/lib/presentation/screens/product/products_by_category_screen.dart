import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/logic/cubits/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:ecommerce/logic/cubits/products_by_category_cubit/products_by_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  static const String routeName = "productsByCategoryScreen";

  const ProductsByCategoryScreen({super.key});

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductByCategoryCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${cubit.category.title}"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: BlocBuilder<ProductByCategoryCubit, ProductsByCategoryState>(
              builder: (context, state){
                if (state is ProductsByCategoryLoadingState && state.products.isEmpty){
                  return Center(child: CircularProgressIndicator(
                  ),);
                }
                if(state is ProductsByCategoryErrorState  && state.products.isEmpty){
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                if(state is ProductsByCategoryLoadedState && state.products.isEmpty){
                  return Center(
                    child: Text("No products found"),
                  );
                }
                return ListView.builder(itemBuilder: itemBuilder);
              })),
    );
  }
}
