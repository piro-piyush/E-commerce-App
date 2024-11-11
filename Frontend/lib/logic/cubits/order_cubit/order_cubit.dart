import 'dart:async';
import 'package:ecommerce/data/models/cart/cart_item_model.dart';
import 'package:ecommerce/data/models/order/order_model.dart';
import 'package:ecommerce/data/repositories/order_repository.dart';
import 'package:ecommerce/logic/cubits/order_cubit/order_state.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_cubit/user_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final UserCubit _userCubit;
  StreamSubscription? _userSubscription;

  OrderCubit(this._userCubit) : super(OrderInitialState()) {
    // initial Value
    _handleUserState(_userCubit.state);

    // Listening to User Cubit (for future updates)
    _userSubscription = _userCubit.stream.listen(_handleUserState);
  }

  void _handleUserState(UserState userState) {
    if (userState is UserLoggedInState) {
      _initialize(userState.userModel.sId!);
    } else if (userState is UserLoggedOutState) {
      emit(OrderInitialState());
    }
  }

  final _orderRepository = OrderRepository();

  void _initialize(String userId) async {
    emit(OrderLoadingState(state.orders));
    try {
      final order = await _orderRepository.fetchOrderByUserId(userId);
      emit(OrderLoadingState(order));
    } catch (ex) {
      emit(OrderErrorState(ex.toString(), state.orders));
    }
  }

  Future<bool> createOrder(
      {required List<CartItemModel> items,
      required String paymentMethod}) async {
    emit(OrderLoadingState(state.orders));
    try {
      if (_userCubit is! UserLoggedInState) {
        return false;
      }
      OrderModel newOrder = OrderModel(
        items: items,
        user: (_userCubit.state as UserLoggedInState).userModel,
        status: (paymentMethod == "pay-on-delivery")
            ? "order-placed"
            : "payment-pending",
      );
      final order = await _orderRepository.createOrder(newOrder);
      List<OrderModel> orders = [...state.orders, order];
      emit(OrderLoadedState(orders));
      return true;
    } catch (ex) {
      emit(OrderErrorState(ex.toString(), state.orders));
      return false;
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
