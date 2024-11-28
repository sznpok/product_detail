import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_detail_app/module/view/product_detail_view.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailView(),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 0.0,
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://oriflamenepal.s3.ap-south-1.amazonaws.com/product_images/product_images-1722342951684.jpeg",
                    fit: BoxFit.cover,
                    height: 150,
                    errorWidget: (c, str, obj) {
                      return Image.asset(
                        'assets/images/shoes.png',
                        fit: BoxFit.cover,
                        height: 200,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "THE ONE",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "Everlasting Sync Foundation SPF 30",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Rs. 2,490",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
