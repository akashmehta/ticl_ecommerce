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
        filterItemsMap[value] = ['0 - 100', '100 - 200', '200 - 300', '300 - 400', '400 - 500'];
      } else if (index == 3) {
        filterItemsMap[value] = ['1', '2', '3', '4', '5'];
      } else if (index == 4) {
        filterItemsMap[value] = ['0 - 100', '100 - 200', '200 - 300', '300 - 400', '400 - 500'];
      }
    });
    return filterItemsMap;
  }
}