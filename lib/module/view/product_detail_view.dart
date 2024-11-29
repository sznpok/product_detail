import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../bloc/product_detail_bloc.dart';
import 'cart_view.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  String stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }

  Color getColor(String colorCode) {
    return Color(int.parse(colorCode.replaceAll('#', '0xff')));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc()..add(FetchProductEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                  SizedBox(
                    height: 300,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: state.image ?? "",
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: List.generate(
                              product?.images?.length ?? 0,
                              (index) => InkWell(
                                onTap: () {
                                  context
                                      .read<ProductDetailBloc>()
                                      .add(ChangeImageEvent(index: index));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: product?.images?[index] ?? "",
                                      width: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product?.title ?? 'N/A',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartView(
                                product: state.product,
                                quantity: state.quantity,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add_shopping_cart,
                        ),
                      )
                    ],
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
                    "Code: ${state.colorCode}",
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs. ${state.price}",
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
                      const SizedBox(
                        width: 20,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.cyan),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${product?.offPercent ?? 0}% OFF",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.cyan,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Color (${state.colorName})",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Wrap(
                    children: List.generate(
                      product?.colorVariants?.length ?? 0,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<ProductDetailBloc>()
                                .add(ChangeColorEvent(index: index));
                          },
                          child: CircleAvatar(
                            backgroundColor: getColor(product!
                                .colorVariants![index].color!.colorValue!.first
                                .toString()),
                          ),
                        ),
                      ),
                    ),
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
                          controller: TextEditingController(
                            text: state.quantity.toString(),
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
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
                              onTap: () {
                                if (state.quantity > 0) {
                                  context.read<ProductDetailBloc>().add(
                                        DecreaseQuantityEvent(),
                                      );
                                }
                                return;
                              },
                              child: Icon(
                                Icons.remove,
                                color: state.quantity > 0 ? Colors.white : null,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                context.read<ProductDetailBloc>().add(
                                      IncreaseQuantityEvent(),
                                    );
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<ProductDetailBloc>().add(
                                AddToCartEvent(
                                  product: product!,
                                ),
                              );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Product Added to Cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            backgroundColor: Colors.green,
                          ));
                        },
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
