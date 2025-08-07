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
  @JsonKey(name: 'cart_items')
  List<CartItem>? get cartItems => throw _privateConstructorUsedError;

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
  $Res call({@JsonKey(name: 'cart_items') List<CartItem>? cartItems});
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
  $Res call({Object? cartItems = freezed}) {
    return _then(
      _value.copyWith(
            cartItems: freezed == cartItems
                ? _value.cartItems
                : cartItems // ignore: cast_nullable_to_non_nullable
                      as List<CartItem>?,
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
  $Res call({@JsonKey(name: 'cart_items') List<CartItem>? cartItems});
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
  $Res call({Object? cartItems = freezed}) {
    return _then(
      _$CartDataImpl(
        cartItems: freezed == cartItems
            ? _value._cartItems
            : cartItems // ignore: cast_nullable_to_non_nullable
                  as List<CartItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartDataImpl implements _CartData {
  const _$CartDataImpl({
    @JsonKey(name: 'cart_items') final List<CartItem>? cartItems,
  }) : _cartItems = cartItems;

  factory _$CartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDataImplFromJson(json);

  final List<CartItem>? _cartItems;
  @override
  @JsonKey(name: 'cart_items')
  List<CartItem>? get cartItems {
    final value = _cartItems;
    if (value == null) return null;
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CartData(cartItems: $cartItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDataImpl &&
            const DeepCollectionEquality().equals(
              other._cartItems,
              _cartItems,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartItems));

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
    @JsonKey(name: 'cart_items') final List<CartItem>? cartItems,
  }) = _$CartDataImpl;

  factory _CartData.fromJson(Map<String, dynamic> json) =
      _$CartDataImpl.fromJson;

  @override
  @JsonKey(name: 'cart_items')
  List<CartItem>? get cartItems;

  /// Create a copy of CartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartDataImplCopyWith<_$CartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery')
  String? get delivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'shippingInformation')
  String? get shippingInformation => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isAddedToCart => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'delivery') String? delivery,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'shippingInformation') String? shippingInformation,
    @JsonKey(includeToJson: false, includeFromJson: false) bool isAddedToCart,
  });
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? delivery = freezed,
    Object? quantity = freezed,
    Object? shippingInformation = freezed,
    Object? isAddedToCart = null,
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
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            delivery: freezed == delivery
                ? _value.delivery
                : delivery // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            shippingInformation: freezed == shippingInformation
                ? _value.shippingInformation
                : shippingInformation // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAddedToCart: null == isAddedToCart
                ? _value.isAddedToCart
                : isAddedToCart // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
    _$CartItemImpl value,
    $Res Function(_$CartItemImpl) then,
  ) = __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'delivery') String? delivery,
    @JsonKey(name: 'quantity') int? quantity,
    @JsonKey(name: 'shippingInformation') String? shippingInformation,
    @JsonKey(includeToJson: false, includeFromJson: false) bool isAddedToCart,
  });
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
    _$CartItemImpl _value,
    $Res Function(_$CartItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? delivery = freezed,
    Object? quantity = freezed,
    Object? shippingInformation = freezed,
    Object? isAddedToCart = null,
  }) {
    return _then(
      _$CartItemImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        delivery: freezed == delivery
            ? _value.delivery
            : delivery // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        shippingInformation: freezed == shippingInformation
            ? _value.shippingInformation
            : shippingInformation // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAddedToCart: null == isAddedToCart
            ? _value.isAddedToCart
            : isAddedToCart // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'title') this.title,
    @JsonKey(name: 'image') this.image,
    @JsonKey(name: 'description') this.description,
    @JsonKey(name: 'price') this.price,
    @JsonKey(name: 'delivery') this.delivery,
    @JsonKey(name: 'quantity') this.quantity,
    @JsonKey(name: 'shippingInformation') this.shippingInformation,
    @JsonKey(includeToJson: false, includeFromJson: false)
    this.isAddedToCart = false,
  });

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'price')
  final double? price;
  @override
  @JsonKey(name: 'delivery')
  final String? delivery;
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'shippingInformation')
  final String? shippingInformation;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool isAddedToCart;

  @override
  String toString() {
    return 'CartItem(id: $id, title: $title, image: $image, description: $description, price: $price, delivery: $delivery, quantity: $quantity, shippingInformation: $shippingInformation, isAddedToCart: $isAddedToCart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.shippingInformation, shippingInformation) ||
                other.shippingInformation == shippingInformation) &&
            (identical(other.isAddedToCart, isAddedToCart) ||
                other.isAddedToCart == isAddedToCart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    image,
    description,
    price,
    delivery,
    quantity,
    shippingInformation,
    isAddedToCart,
  );

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(this);
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'title') final String? title,
    @JsonKey(name: 'image') final String? image,
    @JsonKey(name: 'description') final String? description,
    @JsonKey(name: 'price') final double? price,
    @JsonKey(name: 'delivery') final String? delivery,
    @JsonKey(name: 'quantity') final int? quantity,
    @JsonKey(name: 'shippingInformation') final String? shippingInformation,
    @JsonKey(includeToJson: false, includeFromJson: false)
    final bool isAddedToCart,
  }) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'price')
  double? get price;
  @override
  @JsonKey(name: 'delivery')
  String? get delivery;
  @override
  @JsonKey(name: 'quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'shippingInformation')
  String? get shippingInformation;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isAddedToCart;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
