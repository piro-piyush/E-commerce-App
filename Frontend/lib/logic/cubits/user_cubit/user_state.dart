import 'package:ecommerce/data/models/users/user_model.dart';

abstract class UserState{}

class UserInitialState extends UserState{}

class UserLoadingState extends UserState{}

class UserLoggedInState extends UserState{
  final UserModel userModel;

  UserLoggedInState({required this.userModel});
}

class UserLoggedOutState extends UserState{}

class UserErrorState extends UserState{
  final String errorMessage;

  UserErrorState({required this.errorMessage});
}

