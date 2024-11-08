import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/logic/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce/logic/cubits/product_cubit/product_state.dart';
import 'package:ecommerce/logic/services/formatter.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
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
      builder: (context,state){
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              // Space between items horizontally
              mainAxisSpacing: 16,
              childAspectRatio: 2.2,
            ),
            itemCount:state.products.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                        imageUrl:
                        product.images![0],
                        height: 90,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               SizedBox(
                                width: 200,
                                child: Text(
                                  product.title!,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      letterSpacing: 0.1,
                                      wordSpacing: 0.1),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const GapWidget(size: -5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    "₹ ${Formatter.formatPrice(product.price!)}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: const Icon(
                                      Icons.shopping_cart,
                                      size: 24,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ));
            });
      },
    );
  }
}
