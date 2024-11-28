import 'package:flutter/material.dart';

import '../widget/custom_product_card.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        itemCount: 5,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CustomProductCard(),
          );
        },
      ),
    );
  }
}
