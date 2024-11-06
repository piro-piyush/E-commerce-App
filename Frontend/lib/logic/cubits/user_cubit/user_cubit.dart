import 'package:ecommerce/data/models/users/user_model.dart';
import 'package:ecommerce/data/respositories/user_repository.dart';
import 'package:ecommerce/logic/cubits/user_cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  final UserRepository _userRepository = UserRepository();

  void signIn({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel =
          await _userRepository.signIn(email: email, password: password);
      emit(UserLoggedInState(userModel: userModel));
    } catch (ex) {
      emit(UserErrorState(errorMessage: ex.toString()));
    }
  }

  void createAccount({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel =
          await _userRepository.createAccount(email: email, password: password);
      emit(UserLoggedInState(userModel: userModel));
    } catch (ex) {
      emit(UserErrorState(errorMessage: ex.toString()));
    }
  }
}
