import 'package:flutter/material.dart';
import 'package:haupcar_assignment/blocs/category/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar_assignment/blocs/product/products_bloc.dart';
import 'package:haupcar_assignment/models/product_model.dart';
import 'package:haupcar_assignment/screens/product_detail.dart';
import 'package:haupcar_assignment/services/api_services.dart';
import 'package:haupcar_assignment/utils/const_colors.dart';
import 'package:haupcar_assignment/utils/size_config.dart';
import 'package:haupcar_assignment/widgets/common_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:haupcar_assignment/widgets/custom_cache_nw_image.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        showBackIcon: true,
        title: AppLocalizations.of(context)!.products,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig(context).getHorizontalSize(0),
        ),
        child: BlocProvider(
          create: (context) => ProductsBloc(ApiService())..add(FetchProductByCategory(categoryName: categoryName)),
          child: const ProductList(),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.productStatus == ProductStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ConstColors.buttonYellowColor,
            ),
          );
        } else if (state.productStatus == ProductStatus.success) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig(context).getVerticalSize(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig(context).getHorizontalSize(20)),
                child: Text(
                  context.read<CategoryBloc>().state.selectedCategory?.name ?? "",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 10.0, // spacing between rows
                    crossAxisSpacing: 10.0, // spacing between columns
                    mainAxisExtent: SizeConfig(context).getVerticalSize(250),
                  ),
                  padding: const EdgeInsets.all(10.0), // padding around the grid
                  itemCount: state.products.length, // total number of items
                  itemBuilder: (context, index) {
                    return ProductItemCard(item: state.products[index]);
                  },
                ),
              ),
            ],
          );
        } else if (state.productStatus == ProductStatus.failure) {
          return Center(
            child: Text(
              "Re-Try",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: ConstColors.buttonYellowColor,
                  ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ConstColors.buttonYellowColor,
          ),
        );
      },
    );
  }
}

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    required this.item,
    super.key,
  });
  final Product item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: item),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ConstColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10, // Increased blur radius
              offset: const Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig(context).getVerticalSize(10),
          horizontal: SizeConfig(context).getHorizontalSize(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ConstColors.buttonYellowColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomCachedNetworkImage(
                imageUrl: item.thumbnail ?? "",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig(context).getVerticalSize(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.brand ?? item.category ?? "",
                          style: Theme.of(context).textTheme.labelSmall!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        item.price != null
                            ? Text(
                                "\$${item.price!.toStringAsFixed(2)}",
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig(context).getHorizontalSize(30),
                    height: SizeConfig(context).getVerticalSize(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ConstColors.buttonYellowColor.withOpacity(0.3),
                    ),
                    child: const Icon(
                      Icons.near_me,
                      color: ConstColors.blackColor,
                      size: 20,
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
