import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/data/cart_repository.dart';
import 'package:ticl_ecommerce/cart/domain/cart_data.dart';
import 'package:ticl_ecommerce/cart/provider/cart_provider.dart';
import 'package:ticl_ecommerce/util/utility.dart';
import 'package:http/http.dart';

class CartScreen extends ConsumerStatefulWidget {
  CartScreen(Function(int page) onPageChange);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool isAvailable = false;
  bool isOnSale = false;
  double price = 50;
  Widget divider = Utility.commonDivider;
  int quantity = 1;
  bool isLoading = true;
  String? errorMessage;
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final cartDataAsync = ref.watch(cartDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My shopping cart')),
      body: cartDataAsync.when(
        data: (cartData) {
          final products = cartData ?? [];
          print('products: $products');
          if (products.isEmpty) {
            return Center(child: Text('No items in the cart'));
          }
          int totalItems = products.fold(
            0,
            (sum, item) => sum + (item.quantity ?? 0),
          );

          return Column(
            children: [
              Utility.commonDivider,
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    quantity = product.quantity ?? 1;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        imageView(product),
                        const SizedBox(width: 16),
                        productDetailView(
                          product,
                          product.quantity ?? 1,
                          () {
                            setState(() {
                              if ((product.quantity ?? 1) > 1) {
                                products[index] = product.copyWith(
                                  quantity: (product.quantity ?? 1) - 1,
                                );
                              }
                            });
                          },
                          () {
                            setState(() {
                              products[index] = product.copyWith(
                                quantity: (product.quantity ?? 1) + 1,
                              );
                            });
                          },
                          () {
                            // TODO: Implement delete item logic
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: totalItems > 0 ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Proceed to buy ($totalItems items)',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

Widget imageView(Products product) => Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Image.network(
    product.thumbnail ?? '',
    fit: BoxFit.cover,
    errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 50),
  ),
);

Widget productDetailView(
  Products product,
  int quantity,
  VoidCallback onRemove,
  VoidCallback onAdd,
  VoidCallback onDelete,
) => Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        product.title ?? 'No title',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 4),
      Text(
        'Cart description goes here',
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
      const SizedBox(height: 8),
      Text(
        'Rs. ${product.price ?? 'NA'}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      const SizedBox(height: 4),
      Text(
        'Delivery: 4/08/2025',
        style: const TextStyle(fontSize: 12, color: Colors.black54),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: onRemove),
          Text(
            '${quantity ?? 1}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onDelete,
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ],
  ),
);
