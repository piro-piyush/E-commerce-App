import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/logic/cubits/order_cubit/order_cubit.dart';
import 'package:ecommerce/logic/cubits/order_cubit/order_state.dart';
import 'package:ecommerce/logic/services/calculation.dart';
import 'package:ecommerce/logic/services/formatter.dart';
import 'package:ecommerce/presentation/screens/product/product_details_screen.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyOrdersScreen extends StatefulWidget {
  static const String routeName = "myOrdersScreen";

  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
        if (state is OrderLoadingState && state.orders.isEmpty) {
          return Skeletonizer(
            enabled: true,
            child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemCount: state.orders.length,
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      GapWidget(),
                      Divider(
                        color: AppColors.textLight,
                      ),
                      GapWidget(),
                    ],
                  );
                },
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("# - ${order.sId}",
                          style: TextStyles.body2
                              .copyWith(color: AppColors.textLight)),
                      Text(Formatter.formatDate(order.createdOn!),
                          style: TextStyles.body2
                              .copyWith(color: AppColors.accent)),
                      Text(
                          "Order Total : ${Formatter.formatPrice(Calculations.cartTotal(order.items!))}",
                          style: TextStyles.body1
                              .copyWith(fontWeight: FontWeight.bold)),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: order.items!.length,
                          itemBuilder: (context, index) {
                            final item = order.items![index];
                            final product = item.product!;
                            return ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetailsScreen.routeName,
                                    arguments: product);
                              },
                              leading: CachedNetworkImage(
                                width: 50,
                                imageUrl: product.images![0],
                              ),
                              title: Text(
                                "${product.title}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text("Qty : ${item.quantity}"),
                              trailing:
                                  Text(Formatter.formatPrice(product.price!)),
                            );
                          })
                    ],
                  );
                }),
          );
        }
        if (state is OrderErrorState && state.orders.isEmpty) {
          return Center(
              child: Text(
            state.errorMessage,
          ));
        }
        if (state is OrderLoadedState && state.orders.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Icon(
                CupertinoIcons.cube_box_fill,
                size: 180,
              )),
              GapWidget(),
              Text(
                "No Orders Yet",
                style: TextStyles.heading2,
              )
            ],
          );
        }

        if (state is OrderLoadedState) {
          return ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: state.orders.length,
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    GapWidget(),
                    Divider(
                      color: AppColors.textLight,
                    ),
                    GapWidget(),
                  ],
                );
              },
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("# - ${order.sId}",
                        style: TextStyles.body2
                            .copyWith(color: AppColors.textLight)),
                    Text(Formatter.formatDate(order.createdOn!),
                        style:
                            TextStyles.body2.copyWith(color: AppColors.accent)),
                    Text(
                        "Order Total : ${Formatter.formatPrice(Calculations.cartTotal(order.items!))}",
                        style: TextStyles.body1
                            .copyWith(fontWeight: FontWeight.bold)),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: order.items!.length,
                        itemBuilder: (context, index) {
                          final item = order.items![index];
                          final product = item.product!;
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductDetailsScreen.routeName,
                                  arguments: product);
                            },
                            leading: CachedNetworkImage(
                              width: 50,
                              imageUrl: product.images![0],
                            ),
                            title: Text(
                              "${product.title}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text("Qty : ${item.quantity}"),
                            trailing: Text(
                              Formatter.formatPrice(product.price!),
                              style: TextStyles.body1,
                            ),
                            minVerticalPadding: 20,
                          );
                        })
                  ],
                );
              });
        } else {
          return Center(
            child: Text("An error occurred"),
          );
        }
      })),
    );
  }
}
