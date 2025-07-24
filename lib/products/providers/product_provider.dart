import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/product_service_provider.dart';
import '../data/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final service = ref.read(productServiceProvider);
  return ProductRepository(service);
});

class ProductListNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  ProductListNotifier(this._repository): super (const AsyncValue.loading()) {
    print('ProductList constructor called');
    fetchNextPage();
  }

  final ProductRepository _repository;

  int _currentPage = 0;
  final int _limit = 10;
  bool _hasMore = true;

  final List<Map<String, dynamic>> _weatherData = [];

  Future<void> fetchNextPage() async {
    if (!_hasMore) return;
    try {
      print('ProductList: page: $_currentPage limit : $_limit');
      final newData = await _repository.getProductList(page: _currentPage, limit: _limit);
      if (newData.length < _limit) _hasMore = false;

      _weatherData.addAll(newData);
      _currentPage++;
      state = AsyncValue.data(_weatherData);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
  bool get hasMore => _hasMore;
}

final productListNotifierProvider = StateNotifierProvider<ProductListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final repository = ref.read(productRepositoryProvider);
  return ProductListNotifier(repository);
});