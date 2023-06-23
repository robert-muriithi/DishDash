import 'package:DishDash/core/data/local/entity/meal_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class MealsDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertToFavorites(MealEntity collection);

  @Query('SELECT * FROM meal')
  Future<List<MealEntity>> getAllFavorites();

  @Query('DELETE FROM meal')
  Future<void> deleteAllFavorites();

  @Query('DELETE FROM meal WHERE idMeal = :id')
  Future<void> deleteById(String id);

  //Check if the meal is already in the database
  @Query('SELECT * FROM meal WHERE idMeal = :id')
  Future<MealEntity?> getMealById(String id);
}