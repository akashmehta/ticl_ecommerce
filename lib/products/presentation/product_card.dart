import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/domain/product_data.dart';
import 'package:ticl_ecommerce/products/presentation/button_view.dart';
import 'package:ticl_ecommerce/products/presentation/product_detail_view.dart';

import '../../cart/domain/cart_data.dart';
import '../../cart/providers/cart_provider.dart';

import 'dart:convert';

class ProductCard extends ConsumerWidget {
  final Products product;
  final CartNotifier cartNotifier;
  const ProductCard({super.key, required this.cartNotifier, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartItem cart = cartNotifier.getCartData(product.id ?? 0);
    return Card(
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Title, Description, and Image
            imageView(product),
            ProductDetailView(key: key,product: product),
            ButtonView(key: key, cart: cart, onUpdateCart: (cart) {
              cartNotifier.updateCart(product.id ?? 0, cart);
              cartNotifier.updateCount();
              if (kDebugMode) {
                print('cart: ${jsonEncode(cart)}');
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget imageView(Products product) => Container(
    padding: const EdgeInsets.all(6),
    width: double.infinity,
    alignment: Alignment.topCenter,
    child: CachedNetworkImage(
      imageUrl: product.images![0],
      placeholder: (context, url) =>
          Image.asset('assets/placeholder_product.webp'),
      errorWidget: (context, error, stackTrace) => Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );
}
