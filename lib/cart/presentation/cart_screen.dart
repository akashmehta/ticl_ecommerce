import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen(Function(int page) onPageChange);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Screen"),),
      body: const Center(child: Text("Cart Screen")),
    );
  }
}