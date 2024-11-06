import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:ecommerce/presentation/widgets/primary_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider provider = Provider.of<LoginProvider>(context, listen: false);

  @override
  void initState() {
    super.initState();
    provider = Provider.of<LoginProvider>(context, listen: false);
  }

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
          (provider.error != "")
              ? Text(
                  provider.error,
                  style: const TextStyle(color: Colors.red),
                )
              : const SizedBox(),
          PrimaryTextField(
            controller: provider.emailController,
            labelText: "Email",
            validator: (value) {
              if(value == null || value.trim().isEmpty) {
                return "Email address is required!";
              }

              if(!EmailValidator.validate(value.trim())) {
                return "Invalid email address";
              }
              return null;
            },
          ),
          const GapWidget(),
          PrimaryTextField(
            controller: provider.passwordController,
            labelText: "Password",
            validator: (value) {
              if(value == null || value.trim().isEmpty) {
                return "Password is required!";
              }
              return null;
            },
            obsecureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LinkButton(text: "Forgot Password?", color: AppColors.accent)
            ],
          ),
          PrimaryButton(
            onPressed: provider.logIn,
            color: AppColors.accent,
            text: (provider.isLoading) ? "..." : 'Login',
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
