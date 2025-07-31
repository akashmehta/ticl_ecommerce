import 'package:ticl_ecommerce/core/services/filter_service.dart';

import '../services/cart_service.dart';
import '../services/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final filterServiceProvider = Provider<FilterService>((ref) {
  return FilterService();
});

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService();
});
