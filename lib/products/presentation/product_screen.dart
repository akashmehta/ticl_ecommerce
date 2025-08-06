import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/providers/cart_provider.dart';
import 'package:ticl_ecommerce/main.dart';
import 'package:ticl_ecommerce/products/presentation/sort_fab_view.dart';
import '../providers/product_provider.dart';
import '../presentation/product_card.dart';

class ProductListScreen extends ConsumerWidget {

  const ProductListScreen(Function(int page) onPageChange, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(productListNotifierProvider.notifier);
    final productState = ref.watch(productListNotifierProvider);
    final cartNotifier = ref.watch(cartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
          title: TextField(
          onChanged: (value) { notifier.searchProducts(value); },
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
          actions: [
            notifier.isFilterEnabled ? IconButton(icon: Icon(Icons.filter_alt_off), onPressed: () {
              notifier.resetFilter();
            }) : Spacer(),
            ValueListenableBuilder(valueListenable: cartNotifier.countNotifier,
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
                    )),
          ]),
      body: productState.when(
        data: (data) => NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
                && notifier.hasMore
                && !notifier.isLoading
                && !notifier.isFilterEnabled) {
              notifier.fetchNextPage();
            }
            return false;
          },
          child: GridView.count(
            crossAxisCount: 2,
            // Number of columns
            crossAxisSpacing: 0,
            // Horizontal spacing between items
            mainAxisSpacing: 0,
            childAspectRatio: 0.54,
            // Vertical spacing between items
            padding: EdgeInsets.all(6),
            children: List.generate(data.length, (index) {
              return ProductCard(product: data[index]);
            }),
          ),
        ),
        error: (e, _) => Center(child: Text('Error : $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: SortFabView(onSortSelected: (order) {
        notifier.sortProducts(order);
      }),
    );
  }
}
