import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/material.dart';
import 'package:ticl_ecommerce/products/domain/product_data.dart';

class ProductDetailView extends StatelessWidget {

  final Products product;
  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }

}