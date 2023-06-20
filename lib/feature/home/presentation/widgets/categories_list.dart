import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/presentation/widgets/text/small_text.dart';
import 'package:DishDash/feature/home/domain/models/categories_model.dart';
import 'package:DishDash/feature/home/presentation/cubits/categories/categories_cubit.dart';
import 'package:DishDash/feature/home/presentation/cubits/meals/meals_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoriesModel> categories;

  const CategoriesList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedIndex = context.watch<CategoriesCubit>().state.selectedIndex;
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                context.read<CategoriesCubit>().onSelected(index);
                context.read<MealsCubit>().fetchMealsByCategory(categories[index].strCategory);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: selectedIndex == index
                      ? isDarkMode
                      ? AppColors.darkColorScheme.inversePrimary.withOpacity(0.4) : AppColors.lightColorScheme.inversePrimary.withOpacity(0.4)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.all(8.0),
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 29,
                      backgroundImage: CachedNetworkImageProvider(
                          categories[index].strCategoryThumb,
                          scale: 1.0,

                      ),
                    ),
                    Expanded(
                      child: SmallText(
                        text: categories[index].strCategory,
                        color: isDarkMode ? AppColors.lightColorScheme.onPrimary : AppColors.darkColorScheme.onPrimary,
                        size: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

