import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/logic/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce/logic/cubits/product_cubit/product_state.dart';
import 'package:ecommerce/logic/services/formatter.dart';
import 'package:ecommerce/presentation/screens/product/product_details_screen.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridWidget extends StatefulWidget {
  const ProductsGridWidget({super.key});

  @override
  State<ProductsGridWidget> createState() => _ProductsGridWidgetState();
}

class _ProductsGridWidgetState extends State<ProductsGridWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              // Space between items horizontally
              mainAxisSpacing: 16,
              childAspectRatio: 2.2,
            ),
            itemCount: state.products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                      arguments: product);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    // width: 115,
                    // height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.25),
                          offset: const Offset(15, 15),
                          blurRadius: 30,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: product.images![0],
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                        const GapWidget(
                          size: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    product.title!,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        letterSpacing: 0.1,
                                        wordSpacing: 0.1,
                                        color: AppColors.text),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const GapWidget(size: -5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Formatter.formatPrice(product.price!),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.text,
                                        fontSize: 18,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.shopping_cart_outlined,
                                          size: 24, color: AppColors.text),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            });
      },
    );
  }
}
