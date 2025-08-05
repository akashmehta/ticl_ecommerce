// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartData _$CartDataFromJson(Map<String, dynamic> json) {
  return _CartData.fromJson(json);
}

/// @nodoc
mixin _$CartData {
  @JsonKey(name: 'carts')
  List<Carts>? get carts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'skip')
  int? get skip => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int? get limit => throw _privateConstructorUsedError;

  /// Serializes this CartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartDataCopyWith<CartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDataCopyWith<$Res> {
  factory $CartDataCopyWith(CartData value, $Res Function(CartData) then) =
      _$CartDataCopyWithImpl<$Res, CartData>;
  @useResult
  $Res call({
    @JsonKey(name: 'carts') List<Carts>? carts,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'skip') int? skip,
    @JsonKey(name: 'limit') int? limit,
  });
}

/// @nodoc
class _$CartDataCopyWithImpl<$Res, $Val extends CartData>
    implements $CartDataCopyWith<$Res> {
  _$CartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = freezed,
    Object? total = freezed,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(
      _value.copyWith(
            carts: freezed == carts
                ? _value.carts
                : carts // ignore: cast_nullable_to_non_nullable
                      as List<Carts>?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int?,
            skip: freezed == skip
                ? _value.skip
                : skip // ignore: cast_nullable_to_non_nullable
                      as int?,
            limit: freezed == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartDataImplCopyWith<$Res>
    implements $CartDataCopyWith<$Res> {
  factory _$$CartDataImplCopyWith(
    _$CartDataImpl value,
    $Res Function(_$CartDataImpl) then,
  ) = __$$CartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'carts') List<Carts>? carts,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'skip') int? skip,
    @JsonKey(name: 'limit') int? limit,
  });
}

/// @nodoc
class __$$CartDataImplCopyWithImpl<$Res>
    extends _$CartDataCopyWithImpl<$Res, _$CartDataImpl>
    implements _$$CartDataImplCopyWith<$Res> {
  __$$CartDataImplCopyWithImpl(
    _$CartDataImpl _value,
    $Res Function(_$CartDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = freezed,
    Object? total = freezed,
    Object? skip = freezed,
    Object? limit = freezed,
  }) {
    return _then(
      _$CartDataImpl(
        carts: freezed == carts
            ? _value._carts
            : carts // ignore: cast_nullable_to_non_nullable
                  as List<Carts>?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int?,
        skip: freezed == skip
            ? _value.skip
            : skip // ignore: cast_nullable_to_non_nullable
                  as int?,
        limit: freezed == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartDataImpl implements _CartData {
  const _$CartDataImpl({
    @JsonKey(name: 'carts') final List<Carts>? carts,
    @JsonKey(name: 'total') this.total,
    @JsonKey(name: 'skip') this.skip,
    @JsonKey(name: 'limit') this.limit,
  }) : _carts = carts;

  factory _$CartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDataImplFromJson(json);

  final List<Carts>? _carts;
  @override
  @JsonKey(name: 'carts')
  List<Carts>? get carts {
    final value = _carts;
    if (value == null) return null;
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'skip')
  final int? skip;
  @override
  @JsonKey(name: 'limit')
  final int? limit;

  @override
  String toString() {
    return 'CartData(carts: $carts, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDataImpl &&
            const DeepCollectionEquality().equals(other._carts, _carts) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_carts),
    total,
    skip,
    limit,
  );

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDataImplCopyWith<_$CartDataImpl> get copyWith =>
      __$$CartDataImplCopyWithImpl<_$CartDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartDataImplToJson(this);
  }
}

abstract class _CartData implements CartData {
  const factory _CartData({
    @JsonKey(name: 'carts') final List<Carts>? carts,
    @JsonKey(name: 'total') final int? total,
    @JsonKey(name: 'skip') final int? skip,
    @JsonKey(name: 'limit') final int? limit,
  }) = _$CartDataImpl;

  factory _CartData.fromJson(Map<String, dynamic> json) =
      _$CartDataImpl.fromJson;

  @override
  @JsonKey(name: 'carts')
  List<Carts>? get carts;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'skip')
  int? get skip;
  @override
  @JsonKey(name: 'limit')
  int? get limit;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartDataImplCopyWith<_$CartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Carts _$CartsFromJson(Map<String, dynamic> json) {
  return _Carts.fromJson(json);
}

/// @nodoc
mixin _$Carts {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<Products>? get products => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountedTotal')
  double? get discountedTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalProducts')
  int? get totalProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalQuantity')
  int? get totalQuantity => throw _privateConstructorUsedError;

  /// Serializes this Carts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Carts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartsCopyWith<Carts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartsCopyWith<$Res> {
  factory $CartsCopyWith(Carts value, $Res Function(Carts) then) =
      _$CartsCopyWithImpl<$Res, Carts>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'products') List<Products>? products,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'discountedTotal') double? discountedTotal,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'totalProducts') int? totalProducts,
    @JsonKey(name: 'totalQuantity') int? totalQuantity,
  });
}

/// @nodoc
class _$CartsCopyWithImpl<$Res, $Val extends Carts>
    implements $CartsCopyWith<$Res> {
  _$CartsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Carts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? products = freezed,
    Object? total = freezed,
    Object? discountedTotal = freezed,
    Object? userId = freezed,
    Object? totalProducts = freezed,
    Object? totalQuantity = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            products: freezed == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<Products>?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountedTotal: freezed == discountedTotal
                ? _value.discountedTotal
                : discountedTotal // ignore: cast_nullable_to_non_nullable
                      as double?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalProducts: freezed == totalProducts
                ? _value.totalProducts
                : totalProducts // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalQuantity: freezed == totalQuantity
                ? _value.totalQuantity
                : totalQuantity // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartsImplCopyWith<$Res> implements $CartsCopyWith<$Res> {
  factory _$$CartsImplCopyWith(
    _$CartsImpl value,
    $Res Function(_$CartsImpl) then,
  ) = __$$CartsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'products') List<Products>? products,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'discountedTotal') double? discountedTotal,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'totalProducts') int? totalProducts,
    @JsonKey(name: 'totalQuantity') int? totalQuantity,
  });
}

/// @nodoc
class __$$CartsImplCopyWithImpl<$Res>
    extends _$CartsCopyWithImpl<$Res, _$CartsImpl>
    implements _$$CartsImplCopyWith<$Res> {
  __$$CartsImplCopyWithImpl(
    _$CartsImpl _value,
    $Res Function(_$CartsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Carts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? products = freezed,
    Object? total = freezed,
    Object? discountedTotal = freezed,
    Object? userId = freezed,
    Object? totalProducts = freezed,
    Object? totalQuantity = freezed,
  }) {
    return _then(
      _$CartsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        products: freezed == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<Products>?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountedTotal: freezed == discountedTotal
            ? _value.discountedTotal
            : discountedTotal // ignore: cast_nullable_to_non_nullable
                  as double?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalProducts: freezed == totalProducts
            ? _value.totalProducts
            : totalProducts // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalQuantity: freezed == totalQuantity
            ? _value.totalQuantity
            : totalQuantity // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartsImpl implements _Carts {
  const _$CartsImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'products') final List<Products>? products,
    @JsonKey(name: 'total') this.total,
    @JsonKey(name: 'discountedTotal') this.discountedTotal,
    @JsonKey(name: 'userId') this.userId,
    @JsonKey(name: 'totalProducts') this.totalProducts,
    @JsonKey(name: 'totalQuantity') this.totalQuantity,
  }) : _products = products;

  factory _$CartsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  final List<Products>? _products;
  @override
  @JsonKey(name: 'products')
  List<Products>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total')
  final double? total;
  @override
  @JsonKey(name: 'discountedTotal')
  final double? discountedTotal;
  @override
  @JsonKey(name: 'userId')
  final int? userId;
  @override
  @JsonKey(name: 'totalProducts')
  final int? totalProducts;
  @override
  @JsonKey(name: 'totalQuantity')
  final int? totalQuantity;

  @override
  String toString() {
    return 'Carts(id: $id, products: $products, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discountedTotal, discountedTotal) ||
                other.discountedTotal == discountedTotal) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_products),
    total,
    discountedTotal,
    userId,
    totalProducts,
    totalQuantity,
  );

  /// Create a copy of Carts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartsImplCopyWith<_$CartsImpl> get copyWith =>
      __$$CartsImplCopyWithImpl<_$CartsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartsImplToJson(this);
  }
}

abstract class _Carts implements Carts {
  const factory _Carts({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'products') final List<Products>? products,
    @JsonKey(name: 'total') final double? total,
    @JsonKey(name: 'discountedTotal') final double? discountedTotal,
    @JsonKey(name: 'userId') final int? userId,
    @JsonKey(name: 'totalProducts') final int? totalProducts,
    @JsonKey(name: 'totalQuantity') final int? totalQuantity,
  }) = _$CartsImpl;

  factory _Carts.fromJson(Map<String, dynamic> json) = _$CartsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'products')
  List<Products>? get products;
  @override
  @JsonKey(name: 'total')
  double? get total;
  @override
  @JsonKey(name: 'discountedTotal')
  double? get discountedTotal;
  @override
  @JsonKey(name: 'userId')
  int? get userId;
  @override
  @JsonKey(name: 'totalProducts')
  int? get totalProducts;
  @override
  @JsonKey(name: 'totalQuantity')
  int? get totalQuantity;

  /// Create a copy of Carts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartsImplCopyWith<_$CartsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Products _$ProductsFromJson(Map<String, dynamic> json) {
  return _Products.fromJson(json);
}

/// @nodoc
mixin _$Products {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountPercentage')
  double? get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountedTotal')
  double? get discountedTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String? get thumbnail => throw _privateConstructorUsedError;

  /// Serializes this Products to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsCopyWith<Products> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsCopyWith<$Res> {
  factory $ProductsCopyWith(Products value, $Res Function(Products) then) =
      _$ProductsCopyWithImpl<$Res, Products>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'discountPercentage') double? discountPercentage,
    @JsonKey(name: 'discountedTotal') double? discountedTotal,
    @JsonKey(name: 'thumbnail') String? thumbnail,
  });
}

/// @nodoc
class _$ProductsCopyWithImpl<$Res, $Val extends Products>
    implements $ProductsCopyWith<$Res> {
  _$ProductsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? discountPercentage = freezed,
    Object? discountedTotal = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountPercentage: freezed == discountPercentage
                ? _value.discountPercentage
                : discountPercentage // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountedTotal: freezed == discountedTotal
                ? _value.discountedTotal
                : discountedTotal // ignore: cast_nullable_to_non_nullable
                      as double?,
            thumbnail: freezed == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductsImplCopyWith<$Res>
    implements $ProductsCopyWith<$Res> {
  factory _$$ProductsImplCopyWith(
    _$ProductsImpl value,
    $Res Function(_$ProductsImpl) then,
  ) = __$$ProductsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'discountPercentage') double? discountPercentage,
    @JsonKey(name: 'discountedTotal') double? discountedTotal,
    @JsonKey(name: 'thumbnail') String? thumbnail,
  });
}

/// @nodoc
class __$$ProductsImplCopyWithImpl<$Res>
    extends _$ProductsCopyWithImpl<$Res, _$ProductsImpl>
    implements _$$ProductsImplCopyWith<$Res> {
  __$$ProductsImplCopyWithImpl(
    _$ProductsImpl _value,
    $Res Function(_$ProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? discountPercentage = freezed,
    Object? discountedTotal = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(
      _$ProductsImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountPercentage: freezed == discountPercentage
            ? _value.discountPercentage
            : discountPercentage // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountedTotal: freezed == discountedTotal
            ? _value.discountedTotal
            : discountedTotal // ignore: cast_nullable_to_non_nullable
                  as double?,
        thumbnail: freezed == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductsImpl implements _Products {
  const _$ProductsImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'price') this.price,
    @JsonKey(name: 'quantity') this.quantity,
    @JsonKey(name: 'total') this.total,
    @JsonKey(name: 'discountPercentage') this.discountPercentage,
    @JsonKey(name: 'discountedTotal') this.discountedTotal,
    @JsonKey(name: 'thumbnail') this.thumbnail,
  });

  factory _$ProductsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'price')
  final double? price;
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'total')
  final double? total;
  @override
  @JsonKey(name: 'discountPercentage')
  final double? discountPercentage;
  @override
  @JsonKey(name: 'discountedTotal')
  final double? discountedTotal;
  @override
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;

  @override
  String toString() {
    return 'Products(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedTotal: $discountedTotal, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.discountedTotal, discountedTotal) ||
                other.discountedTotal == discountedTotal) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    price,
    quantity,
    total,
    discountPercentage,
    discountedTotal,
    thumbnail,
  );

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      __$$ProductsImplCopyWithImpl<_$ProductsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsImplToJson(this);
  }
}

abstract class _Products implements Products {
  const factory _Products({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'price') final double? price,
    @JsonKey(name: 'quantity') final int? quantity,
    @JsonKey(name: 'total') final double? total,
    @JsonKey(name: 'discountPercentage') final double? discountPercentage,
    @JsonKey(name: 'discountedTotal') final double? discountedTotal,
    @JsonKey(name: 'thumbnail') final String? thumbnail,
  }) = _$ProductsImpl;

  factory _Products.fromJson(Map<String, dynamic> json) =
      _$ProductsImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'price')
  double? get price;
  @override
  @JsonKey(name: 'quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'total')
  double? get total;
  @override
  @JsonKey(name: 'discountPercentage')
  double? get discountPercentage;
  @override
  @JsonKey(name: 'discountedTotal')
  double? get discountedTotal;
  @override
  @JsonKey(name: 'thumbnail')
  String? get thumbnail;

  /// Create a copy of Products
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsImplCopyWith<_$ProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
