import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feature Image & Gallery
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    'https://via.placeholder.com/200', // Feature Image
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.network(
                        'https://via.placeholder.com/100',
                        // Gallery Images
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Product Name
            Text(
              'Product Name',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            // Price with Strike Price & Discount %
            Row(
              children: [
                Text(
                  '\$100',
                  style: TextStyle(
                      fontSize: 16, decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$80',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const SizedBox(width: 8),
                Text(
                  '20% Off',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Variants
            Text(
              'Variants',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Wrap(
              spacing: 8,
              children: ['Red', 'Blue', 'Green', 'Yellow']
                  .map((variant) => Chip(label: Text(variant)))
                  .toList(),
            ),
            const SizedBox(height: 16),
            // Stock Info
            Text(
              'In Stock: 10',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add to Cart'),
              ),
            ),
            const SizedBox(height: 16),
            // Product Description
            Text(
              'Description',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'This is a sample product description.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Specifications
            Text(
              'Specifications',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Weight: 500g\nDimensions: 10x10x5 cm',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Reviews
            Text(
              'Reviews',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              'Great product!',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Message Seller
            ElevatedButton(
              onPressed: () {},
              child: Text('Message Seller'),
            ),
          ],
        ),
      ),
    );
  }
}
