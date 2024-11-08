import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/material.dart';

class ProductsGridWidget extends StatefulWidget {
  const ProductsGridWidget({super.key});

  @override
  State<ProductsGridWidget> createState() => _ProductsGridWidgetState();
}

class _ProductsGridWidgetState extends State<ProductsGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,crossAxisSpacing: 5, // Space between items horizontally
              mainAxisSpacing: 16,
              childAspectRatio: 2.6,),
        itemCount: 12,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
              width: 115,
              height: 60,
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
                          "https://rukminim2.flixcart.com/image/128/128/xif0q/computer/n/1/w/a324-51-thin-and-light-laptop-acer-original-imah43bv4eqswhpz.jpeg?q=70&crop=false",height: 90,width: 120,fit: BoxFit.cover,),
                  const GapWidget(size: 10,),
                  const Expanded(
                    child:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:200,
                            child: Text(
                              "Acer Aspire 3 Backlit Intel Core i5 12th Gen 1235U - (16 GB/512 GB SSD/Windows 11 Home) A324-51 Thin and Light Laptop (14 Inch, Steel Gray, 1.45 Kg)",
                              maxLines:3,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                letterSpacing: 0.1,
                                wordSpacing: 0.1
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GapWidget(size: -5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹ 40990",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.shopping_cart,size: 24,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
