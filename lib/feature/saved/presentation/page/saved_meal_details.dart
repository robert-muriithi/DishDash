import 'package:DishDash/config/theme/colors.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SavedMealDetailsPage extends StatelessWidget {
  final SavedFoodModel meal;
  const SavedMealDetailsPage({Key? key, required this.meal}) : super(key: key);

  List<String> getIngredients(SavedFoodModel meal) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = meal.getSavedFoodIngredient(i);
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }
    return ingredients;
  }

  List<Widget> generateNumberedPoints(String instructions, BuildContext context, bool isDarkMode) {
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
                  style:  TextStyle(
                    fontSize: 16.0,
                    decoration: TextDecoration.none,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
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
    final numberedPoints = generateNumberedPoints(meal.strInstructions ?? '', context, isDarkMode);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: meal.strYoutube!.isNotEmpty,
        child: FloatingActionButton(
          onPressed: () {
            launchURL(meal.strYoutube!);
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
              meal.strMeal!,
              style: TextStyle(
                color: isDarkMode ? AppColors.white : AppColors.white,
              ),
            ),
            //actions: buildAppBarActions(context),
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
                  imageUrl: meal.strMealThumb ?? '',
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
                        meal.strMeal!,
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
                                        meal.strCategory!,
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
                                        meal.strTags?.split(',')[0] ?? 'No Tags',
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
                                        meal.strArea ?? 'No Area',
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
                ...getIngredients(meal).map(
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
}
