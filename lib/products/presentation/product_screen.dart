import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/presentation/sort_fab_view.dart';
import '../providers/product_provider.dart';
import '../presentation/product_card.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(productListNotifierProvider.notifier);
    final productState = ref.watch(productListNotifierProvider);

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
            }) : Spacer()
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
