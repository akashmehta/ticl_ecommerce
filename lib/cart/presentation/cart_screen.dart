import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/providers/product_provider.dart';

import '../domain/cart_data.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen(Function(int page) onPageChange, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.watch(cartNotifierProvider.notifier);
    final productNotifier = ref.watch(productListNotifierProvider.notifier);
    cartNotifier.loadCartScreen(productNotifier.products);
    return Scaffold(
      appBar: AppBar(title: const Text('My cart')),
      body: ValueListenableBuilder(valueListenable: cartNotifier.countNotifier, builder: (context, item, _) {
        return Column(
            children: [
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartState.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final cartItem = cartState[cartState.keys.elementAt(index)];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        imageView(cartItem),
                        const SizedBox(width: 16),
                        // Product Details
                        cartDetailView(cartItem, (cart) {
                          cartNotifier.updateCart(cartItem?.id ?? 0, cart);
                          cartNotifier.updateCount();
                        }),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text('Total Cost',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                              cartNotifier.totalCost().toStringAsFixed(2),
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cartState.isNotEmpty ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Proceed to buy (${cartNotifier.countNotifier.value} items)',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]);
      },
      ),
    );

  }
}

Widget imageView(CartItem? cartItem) => Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Image.network(
                        cartItem?.image ?? "",
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 50),
                      ),
);

Widget cartDetailView(
  CartItem? cartItem, Function(CartItem) onUpdateCart
) {
  ValueNotifier<CartItem> cartNotifier = ValueNotifier(cartItem ?? CartItem());
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem?.title??"",
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          'Rs. ${cartItem?.price}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 4),
        Text(
          'Delivery: ${cartItem?.shippingInformation}',
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(valueListenable: cartNotifier, builder: (context, item, _) {
          return Row(
            children: [
              IconButton(icon: const Icon(Icons.remove), onPressed: () {
                if ((item.quantity ?? 0) > 1) {
                  cartNotifier.value = item.copyWith(
                    isAddedToCart: true,
                    quantity: (item.quantity ?? 0) - 1,
                  );
                } else {
                  cartNotifier.value = item.copyWith(
                    isAddedToCart: false,
                    quantity: 0,
                  );
                }
                onUpdateCart(cartNotifier.value);

              }),
              Text(
                '${item.quantity}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              IconButton(icon: const Icon(Icons.add), onPressed: () {
                cartNotifier.value = item.copyWith(
                  isAddedToCart: true,
                  quantity: (item.quantity ?? 0) + 1,
                );
                onUpdateCart(cartNotifier.value);
              }),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  cartNotifier.value = item.copyWith(
                    isAddedToCart: false,
                    quantity: 0,
                  );
                  onUpdateCart(cartNotifier.value);
                },
                child: const Text('Remove', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        }),
      ],
    ),
  );
}
