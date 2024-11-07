import 'package:ecommerce/core/ui.dart';
import 'package:ecommerce/presentation/screens/home/category_screen.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/home/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  static const String routeName = "/bottomNavBar";

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        bottomNavigationBar: Container(
          color: AppColors.textLight,
          height: 70,
          child: TabBar(
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                  text: "Home",
                ),
                Tab(
                  icon: Icon(Icons.category_outlined),
                  text: "Category",
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: "Profile",
                ),
              ],
              indicatorColor: AppColors.text,
              labelColor: AppColors.text,
              unselectedLabelColor: AppColors.white),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            CategoryScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
