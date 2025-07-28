import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/cart_screen.dart';
import 'package:ticl_ecommerce/filter/filter_screen.dart';
import 'package:ticl_ecommerce/products/presentation/product_screen.dart';

void main() {
  runApp( ProviderScope(child: MyApp()) );
}

final ValueNotifier<int> selectedIndex = ValueNotifier(0);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> pages = [ProductListScreen(), FilterScreen(), CartScreen(),];

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
                BottomNavigationBarItem(icon: Icon(Icons.filter_list_alt), label: 'Filter'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              ],
            ),
          );
        },
      ),
    );
  }
}
