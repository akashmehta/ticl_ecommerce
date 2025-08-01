import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ticl_ecommerce/util/utility.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isAvailable = false;
  bool isOnSale = false;
  double price = 50;
  Widget divider = Utility.commonDivider;
  int quantity = 1;
  final Map<String, dynamic> product = {
    'images': 'https://picsum.photos/id/237/200/300',
    'title': 'Sample Product',
    'description': 'This is a sample product  description.',
    'price': 100.0,
    'rating': 4.5,
  };

  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'https://picsum.photos/id/237/200/300',
      'title': 'Product Name 1',
      'description': 'Description for product 1',
      'price': 100.0,
      'delivery': '2025-06-05',
      'quantity': 1,
    },
    {
      'image': 'https://picsum.photos/id/238/200/300',
      'title': 'Product Name 2',
      'description': 'Description for product details 2',
      'price': 150.0,
      'delivery': '2025-06-06',
      'quantity': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalItems = cartItems.fold(
      0,
      (sum, item) => sum + item['quantity'] as int,
    );


    return Scaffold(
      appBar: AppBar(title: const Text('My shopping cart')),
      body: Column(
        children: [
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    imageView(product),
                    const SizedBox(width: 16),
                    // Product Details
                    productDetailView(
                      product,
                      quantity,
                      () {
                        setState(() {
                          if (product['quantity'] > 1) {
                            product['quantity']--;
                          }
                        });
                      },
                      () {
                        setState(() {
                          product['quantity']++;
                        });
                      },
                      () {
                        setState(() {
                          cartItems.removeAt(index);
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: totalItems > 0 ? () {} : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Proceed to buy ($totalItems items)',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget imageView(Map<String, dynamic> product) => Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade300),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Image.network(
                        product['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 50),
                      ),
);

Widget productDetailView(
  Map<String, dynamic> product,
  int quantity,
  VoidCallback onRemove,
  VoidCallback onAdd,
  VoidCallback onDelete,
) => Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        product['title'],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 4),
      Text(
        product['description'],
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
      const SizedBox(height: 8),
      Text(
        'Rs. ${product['price']}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      const SizedBox(height: 4),
      Text(
        'Delivery: ${product['delivery']}',
        style: const TextStyle(fontSize: 12, color: Colors.black54),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: onRemove),
          Text(
            '${product['quantity']}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onDelete,
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ],
  ),
);
