import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/domain/product_data.dart';
import '../../core/providers/service_providers.dart';
import '../data/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final service = ref.read(productServiceProvider);
  return ProductRepository(service);
});

class ProductListNotifier
    extends StateNotifier<AsyncValue<List<Products>>> {
  ProductListNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchNextPage();
  }

  final ProductRepository _repository;

  int _currentPage = 0;
  final int _limit = 10;
  bool _hasMore = true;
  bool _isLoading = false;

  final List<Products> _productData = [];
  final List<RangeValues> priceRanges = [
    RangeValues(0, 500),
    RangeValues(501, 1000),
    RangeValues(1001, 2000),
    RangeValues(2001, double.infinity),
  ];
  List<Products> filteredList = [];

  Future<void> fetchNextPage() async {
    if (!_hasMore || _isLoading) return;
    try {
      _isLoading = true;
      final newData = await _repository.getProductList(
        page: _currentPage,
        limit: _limit,
      );
      if (newData.length < _limit) _hasMore = false;
      _productData.addAll(newData);
      _currentPage++;
      _isLoading = false;
      state = AsyncValue.data(_productData);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  bool get hasMore => _hasMore;

  bool get isLoading => _isLoading;

  ValueNotifier<bool> isFilterEnabled = ValueNotifier(false);

  List<Products> get products => _productData;

  void resetFilter() {
    filteredList.clear();
    isFilterEnabled.value = false;
    state = AsyncValue.data(_productData);
  }

  // search product from the list.
  void searchProducts(String value) {
    if (value.isEmpty) {
      state = AsyncValue.data(_productData);
    } else {
      List<Products> productList = _productData.where((product) {
        return product.title!.toLowerCase().startsWith(value.toLowerCase());
      }).toList();
      if (productList.isEmpty) {
        state = AsyncValue.error('No product found', StackTrace.current);
      } else {
        state = AsyncValue.data(productList);
      }
    }
  }

  void sortProducts(String order) {
    List<Products> sortedProducts = [];
    sortedProducts.addAll(_productData);
    if (order == 'asc') {
      sortedProducts.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (order == 'desc') {
      sortedProducts.sort((a, b) => b.price!.compareTo(a.price!));
    }
    state = AsyncValue.data(sortedProducts);
  }

  void filterProducts(Map<String, List<String?>> filterItems) {
    isFilterEnabled.value = filterItems.isNotEmpty;
    filteredList = _productData.where((product) {
      bool matchesCategory = true;
      bool matchesBrand = true;
      bool matchesPrice = true;
      bool matchesRating = true;

      if (filterItems.containsKey('Category')) {
        matchesCategory = filterItems['Category']?.contains(product.category) ?? false;
      }

      if (filterItems.containsKey('Brand')) {
        matchesBrand = filterItems['Brand']?.contains(product.brand) ?? false;
      }

      if (filterItems.containsKey('Price')) {
        matchesPrice = filterItems['Price']?.any((rangeStr) {
          final range = priceRanges.firstWhere((range) {
            return  (range == priceRanges[3] && rangeStr == '>2000') ||
            ('${range.start.toInt()}–${range.end.toInt()}' == rangeStr);
          });
          return (product.price ?? 0) >= range.start && (product.price ?? 0) <= range.end;
        }) ?? false;
      }

      if (filterItems.containsKey('Rating')) {
        matchesRating = filterItems['Rating']?.any((ratingStr) {
          return product.rating?.toInt() == double.parse(ratingStr ?? 1.toString()).toInt();
        }) ?? false;
      }

      return matchesCategory && matchesBrand && matchesPrice && matchesRating;
    }).toSet().toList();
    state = AsyncValue.data(filteredList);
  }
}

final productListNotifierProvider =
    StateNotifierProvider<ProductListNotifier, AsyncValue<List<Products>>>((ref) {
      final repository = ref.read(productRepositoryProvider);
      return ProductListNotifier(repository);
    });
