import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

import 'core/routes.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:Routes.onGenerateRoutes,
      initialRoute: LoginScreen.routeName,
    );
  }
}
