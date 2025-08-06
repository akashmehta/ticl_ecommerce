import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/cart/domain/cart_data.dart';
import 'package:ticl_ecommerce/cart/data/cart_repository.dart';
import 'package:ticl_ecommerce/core/providers/service_providers.dart';

// Repository provider (inject the actual dependency, e.g., an API client or service)
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final service = ref.read(
    cartServiceProvider,
  ); // Use the correct service provider here
  return CartRepository(service);
});

// Cart data provider using FutureProvider
final cartDataProvider = FutureProvider<List<Products>?>((ref) async {
  final repo = ref.watch(cartRepositoryProvider);
  return await repo.fetchCartItems();
});

class CartNotifier extends StateNotifier<AsyncValue<List<Products>?>> {
  CartNotifier(this._repo) : super(const AsyncValue.loading()) {
    fetchCart();
  }

  final CartRepository _repo;

  Future<void> fetchCart() async {
    try {
      state = const AsyncValue.loading();
      final data = await _repo.fetchCartItems();
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<Products>?>>((ref) {
      final repo = ref.watch(cartRepositoryProvider);
      return CartNotifier(repo);
    });
