import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../products/domain/product_data.dart';
import 'package:flutter/services.dart';

class ProductDetailView extends StatelessWidget {
  final Products product;
  const ProductDetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call this in your main() or wherever needed:
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    ); // Show status bar
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Detail',

          style: TextStyle(
            fontSize: 24,

            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          alignment: Alignment.centerRight,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(product.thumbnail ?? '', fit: BoxFit.cover),
          SizedBox(height: 16),
          Text(
            product.title ?? 'Product Title',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text('Price: ${product.price ?? 0}'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add to cart logic here
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
