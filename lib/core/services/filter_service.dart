import 'package:ticl_ecommerce/products/domain/product_data.dart';

class FilterService {

  Map<String, List<String?>> filterItems(List<Products> products, List<String> categories) {
    Map<String, List<String?>> filterItemsMap = {};
    categories.asMap().forEach((index, value) {
      if (index == 0) {
        filterItemsMap[value] = products.map(
                (product) {return product.category;}).toSet().toList();
      } else if (index == 1) {
        filterItemsMap[value] = products.map(
                (product) {return product.brand;}).toSet().toList();
      } else if (index == 2) {
        filterItemsMap[value] = ['0 - 500', '501 - 1000', '1001 - 2000', '>2000'];
      } else if (index == 3) {
        filterItemsMap[value] = ['1', '2', '3', '4', '5'];
      } else if (index == 4) {
        filterItemsMap[value] = ['0 - 5', '6 - 10', '11 - 15', '16 - 20', '>20'];
      }
    });
    return filterItemsMap;
  }
}