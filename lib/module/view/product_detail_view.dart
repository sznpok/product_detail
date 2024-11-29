import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../bloc/product_detail_bloc.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  String stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc()..add(FetchProductEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state.isLoading && state.productData == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final product = state.productData?.product;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    product?.title ?? 'N/A',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.6),
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    product?.category?.title ?? 'N/A',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Code: ${product?.brand?.slug ?? 'N/A'}",
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
                        initialRating: product?.ratings?.toDouble() ?? 0.0,
                        minRating: 1.0,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20.0,
                        onRatingUpdate: (rating) {
                          return;
                        },
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
                  Row(
                    children: [
                      Text(
                        "Rs. ${product?.price ?? "N/A"}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Rs. ${product?.strikePrice ?? "N/A"}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 16.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          stripHtml(
                            product?.description ?? "N/A",
                          ),
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14.0,
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
                            ),
                      ),
                      childrenPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      children: [
                        Text(
                          stripHtml(product?.ingredient ?? "N/A"),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.0,
                                  ),
                          textAlign: TextAlign.justify,
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
                          stripHtml(
                            product?.howToUse ?? "N/A",
                          ),
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
