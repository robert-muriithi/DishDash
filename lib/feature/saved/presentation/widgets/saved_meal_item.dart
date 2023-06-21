
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SavedMealItem extends StatelessWidget {
  final SavedFoodModel meal;
  Function(String) onDelete;
  SavedMealItem({Key? key, required this.meal, required this.onDelete}) : super(key: key);

  String removeNewlines(String input) {
    return input.replaceAll('\r', '').replaceAll('\n', '');
  }

  @override
  Widget build(BuildContext context) {
    final instruction = removeNewlines(meal.strInstructions ?? "");
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Dismissible(
      direction: DismissDirection.endToStart,
      key:  UniqueKey(),
      onDismissed: (direction) {
        onDelete(meal.idMeal ?? "");
      },
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.grey.shade900 : Colors.grey.shade300,
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: CachedNetworkImage(
                  height: 120,
                  imageUrl: meal.strMealThumb ?? "",
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        meal.strMeal ?? "",
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8,),
                    Text(
                      instruction,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
