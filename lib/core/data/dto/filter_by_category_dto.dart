
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';

class MealsByCategoryDto {
  List<Meals> meals;
  MealsByCategoryDto({required this.meals});

  factory MealsByCategoryDto.fromJson(Map<String, dynamic> json) {
    return MealsByCategoryDto(meals: List<Meals>.from(json['meals'].map((x) => Meals.fromJson(x))));
  }

}

class Meals extends MealByCategoryModel {

  Meals({required super.strMeal, required super.strMealThumb, required super.idMeal});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }

}
