import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Rating and image
            Row(
              children: [
                Expanded(flex: 1, child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 24,
                  child: Text(
                    product['rating'].toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )),
                const SizedBox(width: 12),
                Expanded(flex: 5, child: Column(children: [
                  Text(
                    product['title'],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    product['description'] ?? '',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],)),

                const SizedBox(width: 12),
                // Replace with actual asset or network image
                Expanded(flex: 3, child: Image.network(
                  product['images'][0],
                  fit: BoxFit.cover,
                )),
              ],
            ),
            const SizedBox(height: 12),
            // Discount label
            Row(
              children: [
                Text(product['brand'] ?? 'Unknown'),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    '7% OFF',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Buttons
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('More info'),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text('Compare prices'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
