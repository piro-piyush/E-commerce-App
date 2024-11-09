import 'dart:async';

import 'package:ecommerce/data/models/cart/cart_item_model.dart';
import 'package:ecommerce/data/models/product/product_model.dart';
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

  void addToCart(ProductModel productModel,int qty,)async{
    emit(CartLoadingState(state.items));
    try{
      if(_userCubit.state is UserLoggedInState){
        UserLoggedInState userState = _userCubit.state as UserLoggedInState;
        CartItemModel newItem = CartItemModel(
          product: productModel,
          quantity: qty,
        );
        final items = await _cartRepository.addToCart(userState.userModel.sId!,newItem);
        emit(CartLoadedState(items));
      }else{
        throw "An error occurred while adding the item";
      }
    }catch(ex){
      emit(CartErrorState(ex.toString(), state.items));
    }
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
