import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/presentation/cart_screen.dart';
import 'package:ticl_ecommerce/filter/presentation/filter_screen.dart';
import 'package:ticl_ecommerce/products/presentation/product_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final ValueNotifier<int> selectedIndex = ValueNotifier(0);

Function(int) onPageChange = (page) {
  selectedIndex.value = page;
};

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> pages = [
    ProductListScreen(onPageChange),
    FilterScreen(onPageChange),
    CartScreen(onPageChange),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, index, _) {
          return Scaffold(
            body: pages[index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (newIndex) => selectedIndex.value = newIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.filter_list_alt),
                  label: 'Filter',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
            ),
          );
        },
      ),
      routes: {
        '/ProductDetailView': (context) => Scaffold(
          appBar: AppBar(title: const Text('Product Detail')),
          body: const Center(child: Text('Product Detail View')),
        ),
      },
    );
  }
}
