

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cart/providers/cart_provider.dart';

class CartMenuWidget extends ConsumerWidget {

  final Function(int) onPageChange;

  const CartMenuWidget({
    super.key,
    required this.onPageChange,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CartNotifier cartNotifier = ref.watch(cartNotifierProvider.notifier);
    return ValueListenableBuilder(valueListenable: cartNotifier.countNotifier,
        builder: (context, count, _) =>
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    onPageChange(2);
                  },
                ),
                if (count > 0)
                  Positioned(right: 8, top: 6,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                          minWidth: 15, minHeight: 15),
                      child: Text(
                        '$count',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ));
  }
}