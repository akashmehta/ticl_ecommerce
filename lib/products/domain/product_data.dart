import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data.freezed.dart';
part 'product_data.g.dart';

@freezed
abstract class ProductData with _$ProductData {
  const factory ProductData({
    @JsonKey(name: 'products') List<Products>? products,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'skip') int? skip,
    @JsonKey(name: 'limit') int? limit,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, Object?> json) => _$ProductDataFromJson(json);
}

@freezed
abstract class Products with _$Products {
  const factory Products({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'tags') List<String>? tags,
    @JsonKey(name: 'brand') String? brand,
    @JsonKey(name: 'weight') int? weight,
    @JsonKey(name: 'shippingInformation') String? shippingInformation,
    @JsonKey(name: 'images') List<String>? images,
    @JsonKey(name: 'thumbnail') String? thumbnail
  }) = _Products;

  factory Products.fromJson(Map<String, Object?> json) => _$ProductsFromJson(json);
}

