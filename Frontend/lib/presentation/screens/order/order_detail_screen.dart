import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/data/models/users/user_model.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce/presentation/screens/order/providers/order_detail_provider.dart';
import 'package:ecommerce/presentation/screens/user/edit_profile_screen.dart';
import 'package:ecommerce/presentation/widgets/cart_list_view.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = "orderScreen";

  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Order"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              if (state is UserLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is UserErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              if (state is UserLoggedInState) {
                UserModel userModel = state.userModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Details",
                      style: TextStyles.body2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    GapWidget(),
                    Text(
                      "${userModel.fullName}",
                      style: TextStyles.heading3,
                    ),
                    Text(
                      "Email : ${userModel.email}",
                      style: TextStyles.body2,
                    ),
                    Text(
                      "Phone  : ${userModel.phoneNumber}",
                      style: TextStyles.body2,
                    ),
                    Text(
                      "Address : ${userModel.address}, ${userModel.city}, ${userModel.state}",
                      style: TextStyles.body2,
                    ),
                    LinkButton(
                      text: "Edit Profile",
                      color: AppColors.accent,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, EditProfileScreen.routeName);
                      },
                    )
                  ],
                );
              }
              return SizedBox();
            }),
            GapWidget(),
            Text(
              "Items",
              style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
            ),
            BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              if (state is CartLoadingState && state.items.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is CartErrorState && state.items.isEmpty) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              return CartListView(
                items: state.items,
                shrinkWrap: true,
                noScroll: true,
              );
            }),
            GapWidget(),
            Text(
              "Payment",
              style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
            ),
            GapWidget(),
            Consumer<OrderDetailProvider>(
                builder: (context,provider,child){
              return Column(
                children: [
                  RadioListTile(
                    value: "pay-on-delivery",
                    contentPadding: EdgeInsets.zero,
                    groupValue: provider.paymentMethod,
                    onChanged:provider.changePaymentMethod,
                    title: Text("Pay on Delivery"),
                  ),
                  RadioListTile(
                    value: "pay-now",
                    contentPadding: EdgeInsets.zero,
                    groupValue: provider.paymentMethod,
                    onChanged:provider.changePaymentMethod,
                    title: Text("Pay Now"),
                  ),
                ],
              );
            }),
            GapWidget(),
            PrimaryButton(text: "Place Order", color: AppColors.accent, textColor: AppColors.white,)
          ],
        )));
  }
}
