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

  List<Products> get products => _productData;

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
}

final productListNotifierProvider =
    StateNotifierProvider<ProductListNotifier, AsyncValue<List<Products>>>((ref) {
      final repository = ref.read(productRepositoryProvider);
      return ProductListNotifier(repository);
    });
