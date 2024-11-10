import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/widgets/category_scrollable_list.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/products_grid_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      // backgroundColor: AppColors.accent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  LinkButton(text: "See All", color: AppColors.text),
                ],
              ),
            ),
            const GapWidget(),
            const CategoryScrollableList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  LinkButton(text: "See All", color: AppColors.text),
                ],
              ),
            ),
            const Flexible(
                flex: 1, fit: FlexFit.tight, child: ProductsGridWidget())
          ],
        ),
      ),
    );
  }
}
