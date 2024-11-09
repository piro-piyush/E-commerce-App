import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce/logic/services/formatter.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cartScreen";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<CartCubit,CartState>(
          builder: (context,state){
          if(state is CartLoadingState && state.items.isEmpty ){
            return Skeletonizer(
              enabled: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: LinkButton(text: "Clear cart", color: AppColors.text),
                      )
                    ],
                  ),
                  Divider(
                    height: 0,
                    thickness: 4,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text("Product Name"),
                                subtitle: Text("Price X Qty  = Total"),
                                trailing:
                                InputQty(
                                  initVal: 1,maxVal: 99,minVal: 1,
                                  qtyFormProps: QtyFormProps(enableTyping: true),
                                  decoration: QtyDecorationProps(
                                    isBordered: false,
                                    minusBtn: Icon(
                                      Icons.remove_circle_outline,
                                      color: AppColors.accent,
                                    ),
                                    plusBtn:
                                    Icon(Icons.add_circle_outline_sharp, color: AppColors.accent),
                                  ),
                                  validator: (val){
                                    return null;
                                  },
                                )
                            );
                          })),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("5 Items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
                          Text("Total : ${Formatter.formatPrice(99892)}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),

                        ],
                      ),
                      GapWidget(),
                      Flexible(child: PrimaryButton(text: "Place Order", color: AppColors.accent, textColor: AppColors.white))
                    ],),
                  )
                ],
              ),
            );
          }
          if(state is CartErrorState && state.items.isEmpty){
            return Center(child: Text(state.errorMessage),);
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: LinkButton(text: "Clear cart", color: AppColors.text),
                  )
                ],
              ),
              Divider(
                height: 0,
                thickness: 4,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text("Product Name"),
                            subtitle: Text("Price X Qty  = Total"),
                            trailing:
                            InputQty(
                              initVal: 1,maxVal: 99,minVal: 1,
                              qtyFormProps: QtyFormProps(enableTyping: true),
                              decoration: QtyDecorationProps(
                                isBordered: false,
                                minusBtn: Icon(
                                  Icons.remove_circle_outline,
                                  color: AppColors.accent,
                                ),
                                plusBtn:
                                Icon(Icons.add_circle_outline_sharp, color: AppColors.accent),
                              ),
                              validator: (val){
                                return null;
                              },
                            )
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5 Items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
                      Text("Total : ${Formatter.formatPrice(99892)}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),

                    ],
                  ),
                  GapWidget(),
                  Flexible(child: PrimaryButton(text: "Place Order", color: AppColors.accent, textColor: AppColors.white))
                ],),
              )
            ],
          );
          },
        ),
      ),
    );
  }
}
