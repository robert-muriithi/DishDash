import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:DishDash/feature/home/presentation/cubits/save/save_meal_cubit.dart';
import 'package:DishDash/feature/home/presentation/utils/mapper.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealDetailsWidget extends StatelessWidget {
  final List<MealDetailsModel> meal;

  const MealDetailsWidget({Key? key, required this.meal}) : super(key: key);

  List<String> getIngredients(MealDetailsModel meal) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = meal.getIngredient(i);
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }
    return ingredients;
  }

  List<Widget> generateNumberedPoints(String instructions, BuildContext context) {
    final points = instructions.split('\r\n');
    final numberedPoints = <Widget>[];
    for (var i = 0; i < points.length; i++) {
      final point = points[i];
      final numberedPoint = Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${i + 1}.',
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(text: point),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      numberedPoints.add(numberedPoint);
    }
    return numberedPoints;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final numberedPoints = generateNumberedPoints(meal[0].strInstructions!, context);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: meal[0].strYoutube!.isNotEmpty,
        child: FloatingActionButton(
          onPressed: () {
            launchURL(meal[0].strYoutube!);
          },
          child: const Icon(Icons.slow_motion_video),
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,
            title: Text(
              meal[0].strMeal!,
              style: TextStyle(
                color: isDarkMode ? AppColors.white : AppColors.white,
              ),
            ),
            actions: buildAppBarActions(context),
            expandedHeight: 270.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: meal[0].strMealThumb ?? '',
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.darkGrey, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ]),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        meal[0].strMeal!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/pizza.svg',
                            color: isDarkMode ? AppColors.white : AppColors.black,
                            height: 34,
                            width: 34,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 70,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isDarkMode ? AppColors.darkColorScheme.primary : AppColors.lightColorScheme.primary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      meal[0].strCategory!,
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/tag.svg',
                            color: isDarkMode ? AppColors.white : AppColors.black,
                            height: 34,
                            width: 34,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 70,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isDarkMode ? AppColors.darkColorScheme.primary : AppColors.lightColorScheme.primary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      meal[0].strTags?.split(',')[0] ?? 'No Tags',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/heart.svg',
                            color: isDarkMode ? AppColors.white : AppColors.black,
                            height: 34,
                            width: 34,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 70,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isDarkMode ? AppColors.darkColorScheme.primary : AppColors.lightColorScheme.primary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      meal[0].strArea ?? 'No Area',
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...getIngredients(meal[0]).map(
                      (e) => Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Text('•', style: TextStyle(fontSize: 30)),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    )
                    .toList(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: numberedPoints,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildAppBarActions(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return [
      _addFavorite(meal[0], isDarkMode),
      IconButton(
        icon:  Icon(
            Icons.share,
            color: isDarkMode ? AppColors.white : AppColors.white,
        ),
        onPressed: () {
          Share.share(
              'Check out this meal ${meal[0].strMeal} ${meal[0].strMealThumb}, ${meal[0].strYoutube}');
        },
      ),
    ];
  }

  BlocListener<SaveMealCubit, SaveMealState> _addFavorite(MealDetailsModel meal, bool isDarkMode) {
    return BlocListener<SaveMealCubit, SaveMealState>(
      listener: (context, state) {
        if (state.isSaved == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to Saved Meals'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: BlocBuilder<SaveMealCubit, SaveMealState>(
        builder: (context, state) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: state.isSaved == true ? Colors.red : isDarkMode ? AppColors.white : AppColors.white,
            ),
            onPressed: () {
              context.read<SaveMealCubit>().saveMeal(toMealDetailsModel(meal));
            },
          );
        },
      ),
    );
  }


}




