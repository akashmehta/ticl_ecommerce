
import 'package:ticl_ecommerce/products/domain/product_data.dart';

import '../../core/services/filter_service.dart';

class FilterRepository {

  final FilterService _service;

  FilterRepository(this._service);

  Map<String, List<String?>> fetchFilterTypes(
      List<Products> products, List<String> categories) =>
      _service.filterItems(products, categories);
}