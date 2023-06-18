import 'package:DishDash/core/data/local/dao/meals_dao.dart';
import 'package:DishDash/core/data/local/entity/meal_entity.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'saved_meal_db.g.dart';

@Database(version: 1, entities: [MealEntity])
abstract class AppDatabase extends FloorDatabase {
  MealsDao get mealsDao;
}