import 'dart:async';

import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:ecommerce/logic/cubits/cart_cubit/cart_state.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final UserCubit _userCubit;
  StreamSubscription? _streamSubscription;
  CartCubit(this._userCubit) : super(CartInitialState()) {
    //Initial Value
    _handleUserState(_userCubit.state);

    //Listening to User Cubit (for future update)
    _streamSubscription = _userCubit.stream.listen(_handleUserState);
  }

  void _handleUserState(UserState userState){
    if (userState is UserLoggedInState) {
      _initialize(userState.userModel.sId!);
    } else if (userState is UserLoggedOutState) {
      emit(CartInitialState());
    }
  }

  final _cartRepository = CartRepository();

  Future<void> _initialize(String userId) async {
    emit(CartLoadingState(state.items));
    try {
      final items = await _cartRepository.fetchCartByUserId(userId);
      emit(CartLoadedState(items));
    } catch (ex) {
      emit(CartErrorState(ex.toString(), state.items));
    }
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
