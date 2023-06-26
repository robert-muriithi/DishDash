// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_meal_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MealsDao? _mealsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `meal` (`idMeal` TEXT, `strMeal` TEXT, `strDrinkAlternate` TEXT, `strCategory` TEXT, `strArea` TEXT, `strInstructions` TEXT, `strMealThumb` TEXT, `strTags` TEXT, `strYoutube` TEXT, `strIngredient1` TEXT, `strIngredient2` TEXT, `strIngredient3` TEXT, `strIngredient4` TEXT, `strIngredient5` TEXT, `strIngredient6` TEXT, `strIngredient7` TEXT, `strIngredient8` TEXT, `strIngredient9` TEXT, `strIngredient10` TEXT, `strIngredient11` TEXT, `strIngredient12` TEXT, `strIngredient13` TEXT, `strIngredient14` TEXT, `strIngredient15` TEXT, `strIngredient16` TEXT, `strIngredient17` TEXT, `strIngredient18` TEXT, `strIngredient19` TEXT, `strIngredient20` TEXT, `strMeasure1` TEXT, `strMeasure2` TEXT, `strMeasure3` TEXT, `strMeasure4` TEXT, `strMeasure5` TEXT, `strMeasure6` TEXT, `strMeasure7` TEXT, `strMeasure8` TEXT, `strMeasure9` TEXT, `strMeasure10` TEXT, `strMeasure11` TEXT, `strMeasure12` TEXT, `strMeasure13` TEXT, `strMeasure14` TEXT, `strMeasure15` TEXT, `strMeasure16` TEXT, `strMeasure17` TEXT, `strMeasure18` TEXT, `strMeasure19` TEXT, `strMeasure20` TEXT, `strSource` TEXT, `strImageSource` TEXT, `strCreativeCommonsConfirmed` TEXT, `dateModified` TEXT, PRIMARY KEY (`idMeal`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MealsDao get mealsDao {
    return _mealsDaoInstance ??= _$MealsDao(database, changeListener);
  }
}

class _$MealsDao extends MealsDao {
  _$MealsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _mealEntityInsertionAdapter = InsertionAdapter(
            database,
            'meal',
            (MealEntity item) => <String, Object?>{
                  'idMeal': item.idMeal,
                  'strMeal': item.strMeal,
                  'strDrinkAlternate': item.strDrinkAlternate,
                  'strCategory': item.strCategory,
                  'strArea': item.strArea,
                  'strInstructions': item.strInstructions,
                  'strMealThumb': item.strMealThumb,
                  'strTags': item.strTags,
                  'strYoutube': item.strYoutube,
                  'strIngredient1': item.strIngredient1,
                  'strIngredient2': item.strIngredient2,
                  'strIngredient3': item.strIngredient3,
                  'strIngredient4': item.strIngredient4,
                  'strIngredient5': item.strIngredient5,
                  'strIngredient6': item.strIngredient6,
                  'strIngredient7': item.strIngredient7,
                  'strIngredient8': item.strIngredient8,
                  'strIngredient9': item.strIngredient9,
                  'strIngredient10': item.strIngredient10,
                  'strIngredient11': item.strIngredient11,
                  'strIngredient12': item.strIngredient12,
                  'strIngredient13': item.strIngredient13,
                  'strIngredient14': item.strIngredient14,
                  'strIngredient15': item.strIngredient15,
                  'strIngredient16': item.strIngredient16,
                  'strIngredient17': item.strIngredient17,
                  'strIngredient18': item.strIngredient18,
                  'strIngredient19': item.strIngredient19,
                  'strIngredient20': item.strIngredient20,
                  'strMeasure1': item.strMeasure1,
                  'strMeasure2': item.strMeasure2,
                  'strMeasure3': item.strMeasure3,
                  'strMeasure4': item.strMeasure4,
                  'strMeasure5': item.strMeasure5,
                  'strMeasure6': item.strMeasure6,
                  'strMeasure7': item.strMeasure7,
                  'strMeasure8': item.strMeasure8,
                  'strMeasure9': item.strMeasure9,
                  'strMeasure10': item.strMeasure10,
                  'strMeasure11': item.strMeasure11,
                  'strMeasure12': item.strMeasure12,
                  'strMeasure13': item.strMeasure13,
                  'strMeasure14': item.strMeasure14,
                  'strMeasure15': item.strMeasure15,
                  'strMeasure16': item.strMeasure16,
                  'strMeasure17': item.strMeasure17,
                  'strMeasure18': item.strMeasure18,
                  'strMeasure19': item.strMeasure19,
                  'strMeasure20': item.strMeasure20,
                  'strSource': item.strSource,
                  'strImageSource': item.strImageSource,
                  'strCreativeCommonsConfirmed':
                      item.strCreativeCommonsConfirmed,
                  'dateModified': item.dateModified
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MealEntity> _mealEntityInsertionAdapter;

  @override
  Future<List<MealEntity>> getAllFavorites() async {
    return _queryAdapter.queryList('SELECT * FROM meal',
        mapper: (Map<String, Object?> row) => MealEntity(
            strTags: row['strTags'] as String?,
            strArea: row['strArea'] as String?,
            strCategory: row['strCategory'] as String?,
            strMeal: row['strMeal'] as String?,
            idMeal: row['idMeal'] as String?,
            dateModified: row['dateModified'] as String?,
            strCreativeCommonsConfirmed:
                row['strCreativeCommonsConfirmed'] as String?,
            strDrinkAlternate: row['strDrinkAlternate'] as String?,
            strImageSource: row['strImageSource'] as String?,
            strIngredient1: row['strIngredient1'] as String?,
            strIngredient2: row['strIngredient2'] as String?,
            strIngredient3: row['strIngredient3'] as String?,
            strIngredient4: row['strIngredient4'] as String?,
            strIngredient5: row['strIngredient5'] as String?,
            strIngredient6: row['strIngredient6'] as String?,
            strIngredient7: row['strIngredient7'] as String?,
            strIngredient8: row['strIngredient8'] as String?,
            strIngredient9: row['strIngredient9'] as String?,
            strIngredient10: row['strIngredient10'] as String?,
            strIngredient11: row['strIngredient11'] as String?,
            strIngredient12: row['strIngredient12'] as String?,
            strIngredient13: row['strIngredient13'] as String?,
            strIngredient14: row['strIngredient14'] as String?,
            strIngredient15: row['strIngredient15'] as String?,
            strIngredient16: row['strIngredient16'] as String?,
            strIngredient17: row['strIngredient17'] as String?,
            strIngredient18: row['strIngredient18'] as String?,
            strIngredient19: row['strIngredient19'] as String?,
            strIngredient20: row['strIngredient20'] as String?,
            strInstructions: row['strInstructions'] as String?,
            strMealThumb: row['strMealThumb'] as String?,
            strMeasure1: row['strMeasure1'] as String?,
            strMeasure2: row['strMeasure2'] as String?,
            strMeasure3: row['strMeasure3'] as String?,
            strMeasure4: row['strMeasure4'] as String?,
            strMeasure5: row['strMeasure5'] as String?,
            strMeasure6: row['strMeasure6'] as String?,
            strMeasure7: row['strMeasure7'] as String?,
            strMeasure8: row['strMeasure8'] as String?,
            strMeasure9: row['strMeasure9'] as String?,
            strMeasure10: row['strMeasure10'] as String?,
            strMeasure11: row['strMeasure11'] as String?,
            strMeasure12: row['strMeasure12'] as String?,
            strMeasure13: row['strMeasure13'] as String?,
            strMeasure14: row['strMeasure14'] as String?,
            strMeasure15: row['strMeasure15'] as String?,
            strMeasure16: row['strMeasure16'] as String?,
            strMeasure17: row['strMeasure17'] as String?,
            strMeasure18: row['strMeasure18'] as String?,
            strMeasure19: row['strMeasure19'] as String?,
            strMeasure20: row['strMeasure20'] as String?,
            strSource: row['strSource'] as String?,
            strYoutube: row['strYoutube'] as String?));
  }

  @override
  Future<void> deleteAllFavorites() async {
    await _queryAdapter.queryNoReturn('DELETE FROM meal');
  }

  @override
  Future<void> deleteById(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM meal WHERE idMeal = ?1', arguments: [id]);
  }

  @override
  Future<MealEntity?> getMealById(String id) async {
    return _queryAdapter.query('SELECT * FROM meal WHERE idMeal = ?1',
        mapper: (Map<String, Object?> row) => MealEntity(
            strTags: row['strTags'] as String?,
            strArea: row['strArea'] as String?,
            strCategory: row['strCategory'] as String?,
            strMeal: row['strMeal'] as String?,
            idMeal: row['idMeal'] as String?,
            dateModified: row['dateModified'] as String?,
            strCreativeCommonsConfirmed:
                row['strCreativeCommonsConfirmed'] as String?,
            strDrinkAlternate: row['strDrinkAlternate'] as String?,
            strImageSource: row['strImageSource'] as String?,
            strIngredient1: row['strIngredient1'] as String?,
            strIngredient2: row['strIngredient2'] as String?,
            strIngredient3: row['strIngredient3'] as String?,
            strIngredient4: row['strIngredient4'] as String?,
            strIngredient5: row['strIngredient5'] as String?,
            strIngredient6: row['strIngredient6'] as String?,
            strIngredient7: row['strIngredient7'] as String?,
            strIngredient8: row['strIngredient8'] as String?,
            strIngredient9: row['strIngredient9'] as String?,
            strIngredient10: row['strIngredient10'] as String?,
            strIngredient11: row['strIngredient11'] as String?,
            strIngredient12: row['strIngredient12'] as String?,
            strIngredient13: row['strIngredient13'] as String?,
            strIngredient14: row['strIngredient14'] as String?,
            strIngredient15: row['strIngredient15'] as String?,
            strIngredient16: row['strIngredient16'] as String?,
            strIngredient17: row['strIngredient17'] as String?,
            strIngredient18: row['strIngredient18'] as String?,
            strIngredient19: row['strIngredient19'] as String?,
            strIngredient20: row['strIngredient20'] as String?,
            strInstructions: row['strInstructions'] as String?,
            strMealThumb: row['strMealThumb'] as String?,
            strMeasure1: row['strMeasure1'] as String?,
            strMeasure2: row['strMeasure2'] as String?,
            strMeasure3: row['strMeasure3'] as String?,
            strMeasure4: row['strMeasure4'] as String?,
            strMeasure5: row['strMeasure5'] as String?,
            strMeasure6: row['strMeasure6'] as String?,
            strMeasure7: row['strMeasure7'] as String?,
            strMeasure8: row['strMeasure8'] as String?,
            strMeasure9: row['strMeasure9'] as String?,
            strMeasure10: row['strMeasure10'] as String?,
            strMeasure11: row['strMeasure11'] as String?,
            strMeasure12: row['strMeasure12'] as String?,
            strMeasure13: row['strMeasure13'] as String?,
            strMeasure14: row['strMeasure14'] as String?,
            strMeasure15: row['strMeasure15'] as String?,
            strMeasure16: row['strMeasure16'] as String?,
            strMeasure17: row['strMeasure17'] as String?,
            strMeasure18: row['strMeasure18'] as String?,
            strMeasure19: row['strMeasure19'] as String?,
            strMeasure20: row['strMeasure20'] as String?,
            strSource: row['strSource'] as String?,
            strYoutube: row['strYoutube'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertToFavorites(MealEntity collection) async {
    await _mealEntityInsertionAdapter.insert(
        collection, OnConflictStrategy.replace);
  }
}
