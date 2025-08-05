import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticl_ecommerce/products/domain/product_data.dart';

import '../../cart/data/cart_data.dart';
import '../../cart/providers/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider.notifier);
    Cart cart = cartNotifier.getCartData(product.id ?? 0);
    return Card(
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Title, Description, and Image
            imageView(product),
            productDetailView(product),
            buttonView(product, cart, (cart) {
              cartNotifier.updateCart(product.id ?? 0, cart);
            }),
          ],
        ),
      ),
    );
  }

  Widget imageView(Products product) => Container(
    padding: const EdgeInsets.all(6),
    width: double.infinity,
    alignment: Alignment.topCenter,
    child: CachedNetworkImage(
      imageUrl: product.images![0],
      placeholder: (context, url) =>
          Image.asset('assets/placeholder_product.webp'),
      errorWidget: (context, error, stackTrace) => Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );

  Widget productDetailView(Products product) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        product.title!,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 6),
      Text(
        product.description ?? '',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 10),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              textAlign: TextAlign.start,
              '\u{20B9}${product.price ?? 'NA'}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 5,
            child: IgnorePointer(
              child: AwesomeStarRating(
                rating: product.rating ?? 0.0,
                starCount: 5,
                allowHalfRating: true,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
    ],
  );

  Widget buttonView(Products productData, Cart cart, Function(Cart) onUpdateCart) {
    final cartNotifier = ValueNotifier(cart);
    return ValueListenableBuilder(valueListenable: cartNotifier, builder: (context, item, _) {
      return item.isAddedToCart ? Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (item.quantity > 1) {
                cartNotifier.value = item.copyWith(
                  isAddedToCart: true,
                  quantity: item.quantity - 1,
                );
              } else {
                cartNotifier.value = item.copyWith(
                  isAddedToCart: false,
                  quantity: 0,
                );
              }
              onUpdateCart(cartNotifier.value);
            },
          ),
          Text('${item.quantity}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              cartNotifier.value = item.copyWith(
                isAddedToCart: true,
                quantity: item.quantity + 1,
              );
              onUpdateCart(cartNotifier.value);
            },
          ),
        ],
      ) :  ElevatedButton(
        onPressed: () {
          cartNotifier.value = cart.copyWith(
            isAddedToCart: true,
            quantity: 1,
          );
          onUpdateCart(cartNotifier.value);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          'Add To Cart',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    });
  }
}
