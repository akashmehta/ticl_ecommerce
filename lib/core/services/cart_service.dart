import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:ticl_ecommerce/cart/domain/cart_data.dart';

class CartService {
  final String BASE_URL = 'https://dummyjson.com';

  Future<List<Products>> fetchProductList() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/cart'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final carts = data['carts'] as List<dynamic>? ?? [];

        if (carts.isNotEmpty) {
          final products = carts.first['products'] as List<dynamic>? ?? [];
          return products.map((prod) => Products.fromJson(prod)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to load product cart data');
      }
    } catch (e) {
      print('ProductList: Error $e');
      throw e;
    }
  }
}
