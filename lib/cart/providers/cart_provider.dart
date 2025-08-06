import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/domain/cart_data.dart';

import '../../products/domain/product_data.dart';
import '../../products/providers/product_provider.dart';

class CartNotifier extends StateNotifier<Map<int, Cart>> {
  final Ref _ref;
  AsyncValue<List<Products>>? productState;
  final ValueNotifier<int> countNotifier = ValueNotifier(0);
  CartNotifier(super.state, this._ref) {
    productState = _ref.watch(productListNotifierProvider);
  }

  void loadCartScreen() {
    productState?.when(data: (data) {
      data
          .where((product) {return state[product.id ?? 0]?.isAddedToCart ?? false;})
          .map((product) {
            return Cart(
              id: product.id,
              isAddedToCart: true,
              quantity: state[product.id ?? 0]?.quantity ?? 0,
              title: product.title,
              price: (product.price?.toInt() ?? 0),
              description: product.description,
              image: product.images![0],
            );
          }).forEach((cart) {
            state[(cart.id ?? 0)] = cart;
          });
    }, error: (e, _) => null, loading: () => null);
  }

  void updateCart(int productId, Cart cart) {
    state[productId] = cart;
  }

  Cart getCartData(int productId) => state[productId] ?? Cart(
      isAddedToCart: false, quantity: 0);

  void updateCount() {
    int count = 0;
    state.forEach((key, value) {
      count += (value.quantity ?? 0);
    });
    countNotifier.value = count;
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, Map<int, Cart>>((ref) {
      return CartNotifier({}, ref);
    });
