import 'package:flutter/material.dart';

class Utility {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

static const Widget commonDivider = Divider(
    thickness: 3,
    color: Colors.black,    
    height: 32,
  );

}