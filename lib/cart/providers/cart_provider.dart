import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/domain/cart_data.dart';

import '../../products/domain/product_data.dart';
import '../../products/providers/product_provider.dart';

class CartNotifier extends StateNotifier<Map<int, CartItem>> {
  final Ref _ref;
  AsyncValue<List<Products>>? productState;
  final ValueNotifier<int> countNotifier = ValueNotifier(0);
  CartNotifier(super.state, this._ref) {
    productState = _ref.watch(productListNotifierProvider);
  }

  int totalCost() {
    int total = 0;
    state.forEach((key, value) {
      total += (value.price ?? 0) * (value.quantity ?? 0);
    });
    return total;
  }

  void loadCartScreen() {
    productState?.when(data: (data) {
      data
          .where((product) {return state[product.id ?? 0]?.isAddedToCart ?? false;})
          .map((product) {
            return CartItem(
              id: product.id,
              isAddedToCart: true,
              quantity: state[product.id ?? 0]?.quantity ?? 0,
              title: product.title,
              price: (product.price?.toInt() ?? 0),
              description: product.description,
              image: product.images![0],
              shippingInformation: product.shippingInformation
            );
          }).forEach((cart) {
            state[(cart.id ?? 0)] = cart;
          });
    }, error: (e, _) => null, loading: () => null);
  }

  void removeItem(int productId) {
    state.remove(productId);
  }

  void updateCart(int productId, CartItem cart) {
    if (cart.quantity == 0) {
      state.remove(productId);
    } else {
      state[productId] = cart;
    }
  }

  void updateCount() {
    int count = 0;
    state.forEach((key, value) {
      count += (value.quantity ?? 0);
    });
    countNotifier.value = count;
  }

  int totalItems() {
    int count = 0;
    state.forEach((key, value) {
      count += (value.quantity ?? 0);
    });
    return count;
  }

  CartItem getCartData(int productId) => state[productId] ?? CartItem(
      isAddedToCart: false, quantity: 0);
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, Map<int, CartItem>>((ref) {
      return CartNotifier({}, ref);
    });
