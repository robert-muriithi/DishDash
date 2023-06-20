

import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';

SavedFoodModel toMealDetailsModel(MealDetailsModel model){
  return SavedFoodModel(
    strTags: model.strTags,
    strArea: model.strArea,
    strCategory: model.strCategory,
    strMeal: model.strMeal,
    strMealThumb: model.strMealThumb,
    idMeal: model.idMeal,
    dateModified: model.dateModified,
    strCreativeCommonsConfirmed: model.strCreativeCommonsConfirmed,
    strDrinkAlternate: model.strDrinkAlternate,
    strImageSource: model.strImageSource,
    strIngredient1: model.strIngredient1,
    strIngredient2: model.strIngredient2,
    strIngredient3: model.strIngredient3,
    strIngredient4: model.strIngredient4,
    strIngredient5: model.strIngredient5,
    strIngredient6: model.strIngredient6,
    strIngredient7: model.strIngredient7,
    strIngredient8: model.strIngredient8,
    strIngredient9: model.strIngredient9,
    strIngredient10: model.strIngredient10,
    strIngredient11: model.strIngredient11,
    strIngredient12: model.strIngredient12,
    strIngredient13: model.strIngredient13,
    strIngredient14: model.strIngredient14,
    strIngredient15: model.strIngredient15,
    strIngredient16: model.strIngredient16,
    strIngredient17: model.strIngredient17,
    strIngredient18: model.strIngredient18,
    strIngredient19: model.strIngredient19,
    strIngredient20: model.strIngredient20,
    strInstructions: model.strInstructions,
    strMeasure1: model.strMeasure1,
    strMeasure2: model.strMeasure2,
    strMeasure3: model.strMeasure3,
    strMeasure4: model.strMeasure4,
    strMeasure5: model.strMeasure5,
    strMeasure6: model.strMeasure6,
    strMeasure7: model.strMeasure7,
    strMeasure8: model.strMeasure8,
    strMeasure9: model.strMeasure9,
    strMeasure10: model.strMeasure10,
    strMeasure11: model.strMeasure11,
    strMeasure12: model.strMeasure12,
    strMeasure13: model.strMeasure13,
    strMeasure14: model.strMeasure14,
    strMeasure15: model.strMeasure15,
    strMeasure16: model.strMeasure16,
    strMeasure17: model.strMeasure17,
    strMeasure18: model.strMeasure18,
    strMeasure19: model.strMeasure19,
    strMeasure20: model.strMeasure20,
    strSource: model.strSource,
    strYoutube: model.strYoutube,
  );
}