import 'package:ecommerce/data/models/product/product_model.dart';
import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce/presentation/screens/auth/providers/signup_provider.dart';
import 'package:ecommerce/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/product/product_details_screen.dart';
import 'package:ecommerce/presentation/screens/splash/splash_screen.dart';
import 'package:ecommerce/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginProvider(context),
                child: const LoginScreen()));
      case SignupScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => SignupProvider(context),
                child: const SignupScreen()));
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case BottomNavBar.routeName:
        return CupertinoPageRoute(builder: (context) => const BottomNavBar());
      case ProductDetailsScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ProductDetailsScreen(
                  product: settings.arguments as ProductModel,
                ));
      default:
        return null;
    }
  }
}
