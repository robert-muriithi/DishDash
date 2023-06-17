import 'package:equatable/equatable.dart';

class MealByCategoryModel extends Equatable{
  String strMeal;
  String strMealThumb;
  String idMeal;

  MealByCategoryModel({required this.strMeal, required this.strMealThumb, required this.idMeal});

  @override
  List<Object> get props {
    return [strMeal, strMealThumb, idMeal];
  }
}