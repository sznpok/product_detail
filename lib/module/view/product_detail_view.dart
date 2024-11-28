import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
            CachedNetworkImage(
              imageUrl:
                  "https://oriflamenepal.s3.ap-south-1.amazonaws.com/product_images/product_images-1722342951684.jpeg",
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://oriflamenepal.s3.ap-south-1.amazonaws.com/product_images/product_images-1722342951684.jpeg",
                    height: 70,
                    width: 90,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Product Name
            Text(
              'NOVAGE +',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'Wrinkles + Hyper Pigmentation Set',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "Code: NWH1",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Rating",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                RatingBar(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 20.0,
                  onRatingUpdate: (rating) {},
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    ),
                    empty: const Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  "See All Reviews",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Select Quantity",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "0",
                      isDense: true,
                      fillColor: Colors.black,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ).copyWith(
                      prefixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  child: Text(
                    "Add to Cart",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  "Product Description",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                childrenPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  "Product Ingredients",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                childrenPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  "How to use",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                childrenPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
