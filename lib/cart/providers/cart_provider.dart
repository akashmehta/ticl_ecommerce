import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/data/cart_data.dart';

class CartNotifier extends StateNotifier<Map<int, Cart>> {
  CartNotifier(super.state);

  void updateCart(int productId, Cart cart) {
    state[productId] = cart;
  }

  Cart getCartData(int productId) => state[productId] ?? Cart(isAddedToCart: false, quantity: 0);
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, Map<int, Cart>>((ref) {
      return CartNotifier({});
    });
