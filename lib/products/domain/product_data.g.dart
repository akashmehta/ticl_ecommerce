// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDataImpl _$$ProductDataImplFromJson(Map<String, dynamic> json) =>
    _$ProductDataImpl(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductDataImplToJson(_$ProductDataImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

_$ProductsImpl _$$ProductsImplFromJson(Map<String, dynamic> json) =>
    _$ProductsImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      brand: json['brand'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      shippingInformation: json['shippingInformation'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$ProductsImplToJson(_$ProductsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'tags': instance.tags,
      'brand': instance.brand,
      'weight': instance.weight,
      'shippingInformation': instance.shippingInformation,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };
