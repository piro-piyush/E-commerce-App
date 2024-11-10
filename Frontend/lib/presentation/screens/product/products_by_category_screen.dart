import 'package:ecommerce/logic/cubits/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:ecommerce/logic/cubits/products_by_category_cubit/products_by_category_state.dart';
import 'package:ecommerce/presentation/widgets/product_grid_for_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      body: SafeArea(child:
          BlocBuilder<ProductByCategoryCubit, ProductsByCategoryState>(
              builder: (context, state) {
        if (state is ProductsByCategoryLoadingState && state.products.isEmpty) {
          return Skeletonizer(
            child: Column(
              children: [
                const Flexible(
                    flex: 1, fit: FlexFit.tight, child: ProductGridForDetails())
              ],
            ),
          );
        }
        if (state is ProductsByCategoryErrorState && state.products.isEmpty) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        if (state is ProductsByCategoryLoadedState && state.products.isEmpty) {
          return Center(
            child: Text("No products found"),
          );
        }
        return Column(
          children: [
            const Flexible(
                flex: 1, fit: FlexFit.tight, child: ProductGridForDetails())
          ],
        );
      })),
    );
  }
}
