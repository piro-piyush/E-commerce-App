import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce/presentation/screens/auth/providers/signup_provider.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:ecommerce/presentation/widgets/link_button.dart';
import 'package:ecommerce/presentation/widgets/primary_button.dart';
import 'package:ecommerce/presentation/widgets/primary_text_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String routeName = "/signUp";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeCPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true, elevation: 0, title: const Text("Ecommerce App")),
      body: SafeArea(
        child: Form(
          key: provider.formKey,
          child: ListView(padding: const EdgeInsets.all(16), children: [
            Text("Create Account", style: TextStyles.heading2),
            const GapWidget(size: -10),
            (provider.error != "")
                ? Text(
                    provider.error,
                    style: const TextStyle(color: Colors.red),
                  )
                : const SizedBox(),
            const GapWidget(size: 5),
            PrimaryTextField(
                controller: provider.emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email address is required!";
                  }

                  if (!EmailValidator.validate(value.trim())) {
                    return "Invalid email address";
                  }

                  return null;
                },
                onSubmitted: (val) {
                  if (val != "") {
                    focusNodePassword.requestFocus();
                  }
                  return null;
                },
                labelText: "Email Address"),
            const GapWidget(),
            PrimaryTextField(
                controller: provider.passwordController,
                obsecureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password is required!";
                  }
                  return null;
                },
                onSubmitted: (val) {
                  if (val != "") {
                    focusNodeCPassword.requestFocus();
                  }
                  return null;
                },
                focusNode: focusNodePassword,
                labelText: "Password"),
            const GapWidget(),
            PrimaryTextField(
                controller: provider.cPasswordController,
                obsecureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Confirm your password !";
                  }
                  if (value.trim() != provider.passwordController.text.trim()) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                onSubmitted: (val) {
                  if (val != "") {
                    provider.createAccount;
                  }
                  return null;
                },
                focusNode: focusNodeCPassword,
                labelText: "Confirm Password"),
            const GapWidget(),
            PrimaryButton(
              onPressed: provider.createAccount,
              text: (provider.isLoading) ? "..." : "Create Account",
              color: AppColors.accent,
              textColor: AppColors.white,
            ),
            const GapWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyles.body2),
                const GapWidget(),
                LinkButton(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    text: "Log in",
                    color: AppColors.accent)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
