import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/presentation/sort_fab_view.dart';
import '../../filter/providers/filter_provider.dart';
import '../providers/product_provider.dart';
import '../presentation/product_card.dart';

class ProductListScreen extends ConsumerWidget {

  ProductListScreen(Function(int page) onPageChange, {super.key});

  final ValueNotifier<bool> filterAvailable = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(productListNotifierProvider.notifier);
    final productState = ref.watch(productListNotifierProvider);
    final filterState = ref.watch(filterListNotifierProvider);
    filterState.when(data: (Map<String, List<String?>> items) => {
      filterAvailable.value = items.isNotEmpty
    }, error: (_,_) => {}, loading: () => {});
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
            filterAvailable.value ? IconButton(icon: Icon(Icons.filter_alt_off), onPressed: () {}) : Spacer(),
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ]),
      body: productState.when(
        data: (data) => NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent
                && notifier.hasMore && !notifier.isLoading) {
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
            childAspectRatio: 0.55,
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
