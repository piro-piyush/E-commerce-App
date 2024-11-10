import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce/logic/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce/logic/cubits/category_cubit/category_state.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/screens/product/products_by_category_screen.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-commerce"),
        actions: [
          CupertinoButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              return state.items.isEmpty
                  ? Icon(Icons.shopping_cart_outlined, color: AppColors.text)
                  : Badge(
                      label: Text(state.items.length.toString()),
                      isLabelVisible: state is CartLoadingState ? false : true,
                      child: Icon(Icons.shopping_cart));
            }),
          ),
          const GapWidget()
        ],
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState && state.categories.isEmpty) {
            return Skeletonizer(
              child: ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = state.categories[index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: category.image!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, ProductsByCategoryScreen.routeName,arguments: category);
                    },
                    title: Text(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      category.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      category.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            );
          }
          if (state is CategoryErrorState && state.categories.isEmpty) {
            return Center(child: Text(state.errorMessage.toString()));
          }
          return ListView.builder(
            itemCount: state.categories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = state.categories[index];
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: category.image!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                onTap: (){
                  Navigator.pushNamed(context, ProductsByCategoryScreen.routeName,arguments: category);
                },
                title: Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  category.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  category.description!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward),
              );
            },
          );
        },
      ),
    );
  }
}
