import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import '../../products/domain/product_data.dart';

class ProductService {
  final String BASE_URL = 'https://dummyjson.com';

  Future<List<Products>> fetchProductList({required int page, int limit = 10}) async {
    try {
      final response = await http.get(Uri.parse('$BASE_URL/products?limit=$limit&skip=${page * limit}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ProductData.fromJson(data).products ?? List.empty();
      } else {
        throw Exception('Failed to load product data');
      }
    } catch (e) {
      print('ProductList: Error $e');
      throw e;
    }
  }


  Future<List<Map<String, dynamic>>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);
    return List<Map<String, dynamic>>.from(data['products']);
  }

}