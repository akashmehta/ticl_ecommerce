import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_data.freezed.dart';
part 'cart_data.g.dart';

@freezed
abstract class CartData with _$CartData {
  const factory CartData({
    @JsonKey(name: 'cart_items') List<CartItem>? cartItems,
  }) = _CartData;

  factory CartData.fromJson(Map<String, Object?> json) => _$CartDataFromJson(json);
}

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') int? price,
    @JsonKey(name: 'delivery') String? delivery,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'shippingInformation') String? shippingInformation,
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(false) bool isAddedToCart
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) => _$CartItemFromJson(json);
}

