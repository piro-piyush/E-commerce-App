import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/data/models/product/product_model.dart';
import 'package:ecommerce/logic/services/formatter.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  static const routeName = "/productDetailScreen";

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider.builder(
                  itemCount: widget.product.images!.length,
                  slideBuilder: (index) {
                    final image = widget.product.images![index];
                    return CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.contain,
                    );
                  },
                )),
            GapWidget(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title!,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  GapWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Formatter.formatPrice(
                          widget.product.price!,
                        ),
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      CupertinoButton(
                          child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(14)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 26),
                                      ),
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          onPressed: () {})
                    ],
                  ),
                  GapWidget(
                    size: -5,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  GapWidget(
                    size: -5,
                  ),
                  Text(
                    widget.product.description!,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textLight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
