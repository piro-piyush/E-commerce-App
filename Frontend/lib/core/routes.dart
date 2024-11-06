import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce/presentation/screens/auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch(settings.name){
      case LoginScreen.routeName: return CupertinoPageRoute(builder: (context) => const LoginScreen());
      case SignupScreen.routeName: return CupertinoPageRoute(builder: (context) => const SignupScreen());
      default: return null;
    }
  }
}