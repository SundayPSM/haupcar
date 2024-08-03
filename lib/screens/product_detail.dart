import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:haupcar_assignment/models/product_model.dart';
import 'package:haupcar_assignment/utils/const_colors.dart';
import 'package:haupcar_assignment/utils/size_config.dart';
import 'package:haupcar_assignment/widgets/common_app_bar.dart';
import 'package:haupcar_assignment/widgets/custom_cache_nw_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    required this.product,
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppLocalizations.of(context)!.products,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                // options: CarouselOptions(height: 400.0),
                options: CarouselOptions(
                  height: 400,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: product.images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: SizeConfig(context).screenWidth,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: ConstColors.buttonYellowColor.withOpacity(0.5),
                        ),
                        child: CustomCachedNetworkImage(
                          imageUrl: i,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig(context).getHorizontalSize(10),
                  top: SizeConfig(context).getHorizontalSize(20),
                  right: SizeConfig(context).getHorizontalSize(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.brand ?? "",
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                    Text(
                      product.title ?? "",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                    ),
                    product.rating != null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: product.rating!,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: ConstColors.buttonYellowColor,
                                ),
                                itemSize: 20,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Text(
                                "(${product.rating})",
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: ConstColors.blueColor,
                                      height: 1.5,
                                    ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: SizeConfig(context).getVerticalSize(20),
                    ),
                    Text(
                      product.description ?? "",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ConstColors.darkGrey,
                            height: 1.5,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig(context).getVerticalSize(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total Price",
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      color: ConstColors.darkGrey,
                                    ),
                              ),
                              Text(
                                "\$${product.price}",
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig(context).getVerticalSize(10),
                              horizontal: SizeConfig(context).getHorizontalSize(30),
                            ),
                            decoration: BoxDecoration(color: ConstColors.buttonYellowColor, borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "Shop",
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ConstColors.whiteColor,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
