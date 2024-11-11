import 'package:flutter/material.dart';

class OrdersPlacedScreen extends StatefulWidget {
  static const String routeName = "/ordersPlacedScreen";
  const OrdersPlacedScreen({super.key});

  @override
  State<OrdersPlacedScreen> createState() => _OrdersPlacedScreenState();
}

class _OrdersPlacedScreenState extends State<OrdersPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Order Placed"),
      ),
      body: Center(),
    );
  }
}
