
import 'package:DishDash/core/data/local/database/saved_meal_db.dart';
import 'package:DishDash/core/data/local/entity/meal_entity.dart';
import 'package:DishDash/core/errors/exceptions.dart';

abstract class SavedMealsLocalDataSource{
  Future<List<MealEntity>> getAllSavedMeals();
  Future<void> deleteSavedMeal(String mealId);
}

class SavedMealsLocalDataSourceImpl implements SavedMealsLocalDataSource {
  final AppDatabase database;
  SavedMealsLocalDataSourceImpl(this.database);

  @override
  Future<void> deleteSavedMeal(String mealId) async {
    try{
      final dao = database.mealsDao;
      await dao.deleteById(mealId);
    } catch(e){
      throw DatabaseException(message :e.toString(),);
    }
  }

  @override
  Future<List<MealEntity>> getAllSavedMeals() {
    try{
     return database.mealsDao.getAllFavorites();
    }catch (e){
      throw DatabaseException(message :e.toString(),);
    }
  }
}