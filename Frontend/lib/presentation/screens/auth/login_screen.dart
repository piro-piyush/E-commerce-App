import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:ecommerce/presentation/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-commerce App",
          style: TextStyles.heading3,
        ),
        centerTitle: true,
        backgroundColor: AppColors.accent,
      ),
      body: SafeArea(
          child: ListView(
        padding:
            const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 70),
        children: [
          const Text(
            "Log in",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const GapWidget(),
          PrimaryTextField(
            controller: passwordController,
            labelText: "Email",
          ),
          const GapWidget(),
          PrimaryTextField(
            controller: passwordController,
            labelText: "Password",
            obsecureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [LinkButton(text: "Forgot Password?", color: AppColors.accent)],),
          PrimaryButton(
            onPressed: () {},
            color: AppColors.accent,
            text: 'Login',
            textColor: AppColors.white,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16),
              ),
              const GapWidget(size: -5),
              LinkButton(
                text: "Sign Up",
                onPressed: () {},
                color: AppColors.accent,
              )
            ],
          )
        ],
      )),
    );
  }
}
