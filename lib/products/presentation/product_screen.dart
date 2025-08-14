import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/filter/providers/filter_provider.dart';
import 'package:ticl_ecommerce/products/presentation/sort_fab_view.dart';
import '../../cart/providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../presentation/product_card.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(productListNotifierProvider.notifier);
    final productState = ref.watch(productListNotifierProvider);
    final cartNotifier = ref.watch(cartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: TextField(
            onChanged: (value) {
              productNotifier.searchProducts(value);
            },
            decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                border: InputBorder.none
            ),
          ),
        ),
        actions: [
          productNotifier.isFilterEnabled.value
              ? IconButton(
            icon: Icon(Icons.filter_alt_off),
            onPressed: () {
              productNotifier.resetFilter();
              ref.watch(filterListNotifierProvider.notifier).resetFilter();
            },
          )
              : SizedBox.shrink(),
        ],
      ),
      body: productState.when(
        data: (data) => NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                productNotifier.hasMore &&
                !productNotifier.isLoading &&
                !(productNotifier.isFilterEnabled.value)) {
              productNotifier.fetchNextPage();
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
              return ProductCard(cartNotifier: cartNotifier, product: data[index]);
            }),
          ),
        ),
        error: (e, _) => Center(child: Text('Error : $e')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: SortFabView(
        onSortSelected: (order) {
          productNotifier.sortProducts(order);
        },
      ),
    );
  }
}
