import 'dart:convert';
import 'package:http/http.dart' as http;
class ProductService {
  final String BASE_URL = 'https://dummyjson.com';

  Future<List<Map<String, dynamic>>> fetchProductList({required int page, int limit = 10}) async {
    try {
      final response = await http.get(Uri.parse('$BASE_URL/products?limit=$limit&skip=${page * limit}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['products']);
      } else {
        throw Exception('Failed to load product data');
      }
    } catch (e) {
      print('ProductList: Error $e');
      throw e;
    }
  }
}