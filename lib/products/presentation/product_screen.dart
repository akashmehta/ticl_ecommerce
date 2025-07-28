import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import '../presentation/product_card.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(productListNotifierProvider.notifier);
    final productState = ref.watch(productListNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Product List"),),
      body: productState.when(
        data: (data) => NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                  notifier.hasMore && !notifier.isLoading) {
                print('ProductList data : ${data.length}');
                notifier.fetchNextPage();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ProductCard(product: data[index]),
            ),
          ),
        error: (e, _) => Center(child: Text('Error : $e'),),
        loading: () => Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
