import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/filter/data/filter_repository.dart';
import 'package:ticl_ecommerce/products/domain/product_data.dart';
import 'package:ticl_ecommerce/products/providers/product_provider.dart';

import '../../core/providers/service_providers.dart';


final List<String> _filterCategories = [
  'Category',
  'Brand',
  'Price',
  'Rating'
];

List<String> get filterCategories => _filterCategories;

final filterRepositoryProvider = Provider<FilterRepository>((ref) {
  final service = ref.read(filterServiceProvider);
  return FilterRepository(service);
});

class FilterListNotifier
    extends StateNotifier<AsyncValue<Map<String, List<String?>>>> {

  final FilterRepository _repository;
  final Ref _ref;

  FilterListNotifier(this._repository, this._ref) :
        super(const AsyncValue.loading()) {
    final productState = _ref.watch(productListNotifierProvider);
    productState.when(
      data: (data) => fetchFilterTypes(data, _filterCategories),
      error: (e, _) => null,
      loading: () => null,
    );
  }

  void fetchFilterTypes(List<Products> products, List<String> filterItems) {
    try {
      final filterTypes = _repository.fetchFilterTypes(products, filterItems);
      state = AsyncValue.data(filterTypes);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final filterListNotifierProvider = StateNotifierProvider<FilterListNotifier,
    AsyncValue<Map<String, List<String?>>>>((ref) {
  final repository = ref.read(filterRepositoryProvider);
  return FilterListNotifier(repository, ref);
});
