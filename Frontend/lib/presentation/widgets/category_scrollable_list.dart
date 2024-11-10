import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/logic/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce/logic/cubits/category_cubit/category_state.dart';
import 'package:ecommerce/presentation/screens/product/products_by_category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryScrollableList extends StatefulWidget {
  const CategoryScrollableList({super.key});

  @override
  State<CategoryScrollableList> createState() => _CategoryScrollableListState();
}

class _CategoryScrollableListState extends State<CategoryScrollableList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState && state.categories.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryErrorState && state.categories.isEmpty) {
            return Center(child: Text(state.errorMessage.toString()));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (BuildContext context, int index) {
              final category = state.categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pushNamed(context, ProductsByCategoryScreen.routeName,arguments: category);
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey.shade200,
                          child: CachedNetworkImage(
                            imageUrl: category.image!,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        category.title!,
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.text
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
