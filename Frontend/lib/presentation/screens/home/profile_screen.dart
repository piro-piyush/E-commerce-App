import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/presentation/widgets/gap_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("E-commerce"),
          actions: [Icon(Icons.shopping_cart,color: AppColors.text,),
            const GapWidget()
          ],
        ));
  }

}
