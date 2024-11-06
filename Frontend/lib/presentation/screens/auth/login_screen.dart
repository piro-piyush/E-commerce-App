import 'package:flutter/cupertino.dart';
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
        title: const Text("E-commerce App"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(child: ListView(
        padding: const EdgeInsets.only(bottom: 16, left: 16,right: 16,top: 70),
        children: [
          const Text("Log in", style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.black),
              // hintText: "Email",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),cursorColor: Colors.black,
          ),
          const SizedBox(height: 15,),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.black),
              // hintText: "Password",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            cursorColor: Colors.black,
          ),
          const SizedBox(height: 35,),
          CupertinoButton(child: Container(
            width: MediaQuery.of(context).size.width,
              height: 60,
            decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(14)),
              child: const Center(child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 26),))), onPressed: (){}),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dont have an account?",style: TextStyle(fontSize: 16),),
              const SizedBox(width: 10,),
              CupertinoButton(
                padding: EdgeInsets.zero,
                  child: const Text("Sign Up",style: TextStyle(color: Colors.amber),), onPressed: (){})
            ],
          )
        ],
      )),
    );
  }
}
