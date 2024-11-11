import 'dart:async';
import 'package:ecommerce/data/repositories/order_repository.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce/logic/cubits/order_cubit/order_state.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_cubit/user_state.dart';

class OrderCubit extends Cubit<OrderState>{
  final UserCubit _userCubit;
  StreamSubscription? _userSubscription;

    OrderCubit(this._userCubit):super(OrderInitialState()){
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

    void _initialize(String userId)async{
      emit(OrderLoadingState(state.orders));
        try{
           final orders = await _orderRepository.fetchOrderByUserId(userId);
           emit(OrderLoadingState(orders));
        }catch(ex){
          emit(OrderErrorState(ex.toString(), state.orders));
        }
    }

    @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}