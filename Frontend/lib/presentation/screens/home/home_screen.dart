import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/presentation/widgets/category_scrollable_list.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/products_grid_widget.dart';
import 'package:flutter/material.dart';

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
          Icon(Icons.shopping_cart, color: AppColors.text),
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
             SizedBox(
              height: MediaQuery.of(context).size.height*0.10,
                child:const CategoryScrollableList()),
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
              flex: 1,
              fit: FlexFit.tight,
                child:  ProductsGridWidget())
          ],
        ),
      ),
    );
  }
}
