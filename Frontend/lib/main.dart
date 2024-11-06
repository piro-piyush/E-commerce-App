import 'package:ecommerce/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute:Routes.onGenerateRoutes,
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
