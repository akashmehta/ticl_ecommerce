import '../../core/services/product_service.dart';
import '../domain/product_data.dart';

class ProductRepository {

  final ProductService service;

  ProductRepository(this.service);

  Future<List<Products>> getProductList({required int page, int limit = 10}) {
    return service.fetchProductList(page: page, limit: limit);
    // return service.loadJsonData();
  }
}