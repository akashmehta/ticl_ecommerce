import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/presentation/cart_screen.dart';
import 'package:ticl_ecommerce/filter/presentation/filter_screen.dart';
import 'package:ticl_ecommerce/products/presentation/cart_menu_widget.dart';
import 'package:ticl_ecommerce/products/presentation/product_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final ValueNotifier<int> selectedIndex = ValueNotifier(0);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Function(int) onPageChange = (page) {
    selectedIndex.value = page;
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ProductListScreen(),
      FilterScreen(onPageChange),
      CartScreen(onPageChange),
    ];
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
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.filter_list_alt),
                  label: 'Filter',
                ),
                BottomNavigationBarItem(
                  icon: CartMenuWidget(onPageChange: onPageChange),
                  label: 'Cart',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
