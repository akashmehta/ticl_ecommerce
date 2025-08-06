import '../../core/services/cart_service.dart';
import '../domain/cart_data.dart';

class CartRepository {
  final CartService _service;

  CartRepository(this._service);

  Future<List<Products>> fetchCartItems() {
    return _service.fetchProductList();
  }
}
