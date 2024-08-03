import 'package:flutter/material.dart';
import 'package:haupcar_assignment/blocs/category/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar_assignment/screens/products_screen.dart';
import 'package:haupcar_assignment/utils/const_colors.dart';
import 'package:haupcar_assignment/utils/size_config.dart';
import 'package:haupcar_assignment/widgets/common_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        showBackIcon: false,
        title: AppLocalizations.of(context)!.categories,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig(context).getHorizontalSize(20),
        ),
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.categoryStatus == CategoryStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ConstColors.buttonYellowColor,
                ),
              );
            } else if (state.categoryStatus == CategoryStatus.success) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig(context).getVerticalSize(20),
                    ),
                    Wrap(
                      spacing: SizeConfig(context).getHorizontalSize(15),
                      runSpacing: SizeConfig(context).getHorizontalSize(15),
                      children: state.categories
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                context.read<CategoryBloc>().add(OnCategorySelectedEvent(selectedCategory: e));
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Products(
                                      categoryName: e.slug,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: e == state.selectedCategory ? ConstColors.buttonYellowColor.withOpacity(0.8) : ConstColors.buttonYellowColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: e == state.selectedCategory ? ConstColors.whiteColor : ConstColors.darkGrey,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig(context).getVerticalSize(10),
                                  horizontal: SizeConfig(context).getHorizontalSize(10),
                                ),
                                child: Text(
                                  e.name,
                                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: e == state.selectedCategory ? ConstColors.whiteColor : ConstColors.darkGrey,
                                        fontWeight: e == state.selectedCategory ? FontWeight.bold : null,
                                      ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: SizeConfig(context).getVerticalSize(20),
                    ),
                  ],
                ),
              );
            } else if (state.categoryStatus == CategoryStatus.failure) {
              return Text(
                "Re-Try",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: ConstColors.buttonYellowColor,
                    ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: ConstColors.buttonYellowColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
