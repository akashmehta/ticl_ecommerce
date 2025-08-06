import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/cart_data.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen(Function(int page) onPageChange, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.watch(cartNotifierProvider.notifier);
    cartNotifier.loadCartScreen();
    return Scaffold(
      appBar: AppBar(title: const Text('My cart')),
      body: Column(
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
                    cartDetailView(cartItem, () {}, () {}, () {},),
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
                onPressed: cartState.isNotEmpty ? () {} : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Proceed to buy (${cartState.length} items)',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}

Widget imageView(Cart? cartItem) => Container(
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
  Cart? cartItem,
  VoidCallback onRemove,
  VoidCallback onAdd,
  VoidCallback onDelete,
) => Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        cartItem?.title??"",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 4),
      Text(
        cartItem?.description ?? "",
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
      const SizedBox(height: 8),
      Text(
        'Rs. ${cartItem?.price}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      const SizedBox(height: 4),
      Text(
        'Delivery: ${cartItem?.delivery}',
        style: const TextStyle(fontSize: 12, color: Colors.black54),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: onRemove),
          Text(
            '${cartItem?.quantity}',
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
