import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_data.freezed.dart';
part 'cart_data.g.dart';

@freezed
abstract class CartData with _$CartData {
  const factory CartData({
    @JsonKey(name: 'carts') List<Carts>? carts,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'skip') int? skip,
    @JsonKey(name: 'limit') int? limit,
  }) = _CartData;

  factory CartData.fromJson(Map<String, Object?> json) => _$CartDataFromJson(json);
}

@freezed
abstract class Carts with _$Carts {
  const factory Carts({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'products') List<Products>? products,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'discountedTotal') double? discountedTotal,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'totalProducts') int? totalProducts,
    @JsonKey(name: 'totalQuantity') int? totalQuantity,
  }) = _Carts;

  factory Carts.fromJson(Map<String, Object?> json) => _$CartsFromJson(json);
}

@freezed
abstract class Products with _$Products {
  const factory Products({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'discountPercentage') double? discountPercentage,
    @JsonKey(name: 'discountedTotal') double? discountedTotal,
    @JsonKey(name: 'thumbnail') String? thumbnail,
  }) = _Products;

  factory Products.fromJson(Map<String, Object?> json) => _$ProductsFromJson(json);
}

