// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartDataImpl _$$CartDataImplFromJson(Map<String, dynamic> json) =>
    _$CartDataImpl(
      cartItems: (json['cart_items'] as List<dynamic>?)
          ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartDataImplToJson(_$CartDataImpl instance) =>
    <String, dynamic>{'cart_items': instance.cartItems};

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toInt(),
  delivery: json['delivery'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  shippingInformation: json['shippingInformation'] as String?,
);

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'delivery': instance.delivery,
      'quantity': instance.quantity,
      'shippingInformation': instance.shippingInformation,
    };
