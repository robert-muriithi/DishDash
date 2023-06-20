import 'package:DishDash/core/data/local/database/saved_meal_db.dart';
import 'package:DishDash/core/network/network.dart';
import 'package:DishDash/feature/home/data/datasources/remote/categories_remote_data_source.dart';
import 'package:DishDash/feature/home/data/datasources/remote/meal_by_category_remote_data_source.dart';
import 'package:DishDash/feature/home/data/repository/categories_repository_impl.dart';
import 'package:DishDash/feature/home/data/repository/meals_by_category_repository_impl.dart';
import 'package:DishDash/feature/home/domain/repository/categories_repository.dart';
import 'package:DishDash/feature/home/domain/repository/meals_by_category_repository.dart';
import 'package:DishDash/feature/home/domain/usecase/get_food_categories_usecase.dart';
import 'package:DishDash/feature/home/domain/usecase/get_meal_by_category_usecase.dart';
import 'package:DishDash/feature/home/domain/usecase/get_meal_details.dart';
import 'package:DishDash/feature/home/domain/usecase/save_meal_usecase.dart';
import 'package:DishDash/feature/home/presentation/cubits/categories/categories_cubit.dart';
import 'package:DishDash/feature/home/presentation/cubits/meal_details_cubit.dart';
import 'package:DishDash/feature/home/presentation/cubits/meals/meals_cubit.dart';
import 'package:DishDash/feature/home/presentation/cubits/save/save_meal_cubit.dart';
import 'package:DishDash/feature/saved/data/datasource/saved_meals_local_data_source.dart';
import 'package:DishDash/feature/saved/data/repository/saved_meals_repository_impl.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init () async {
  initFeatures();

  initCore();
  await initExternal();
}

void initFeatures() {
  //Cubits
  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(sl(), sl()));
  sl.registerFactory<MealsCubit>(() => MealsCubit(sl()));
  sl.registerFactory<MealDetailsCubit>(() => MealDetailsCubit(sl()));
  sl.registerFactory<SaveMealCubit>(() => SaveMealCubit(sl()));

  //Use cases
  sl.registerLazySingleton<GetFoodCategoriesUsCase>(() => GetFoodCategoriesUsCase(sl()));
  sl.registerLazySingleton<GetMealsByCategoryUseCase>(() => GetMealsByCategoryUseCase(sl()));
  sl.registerLazySingleton<GetMealDetailsUseCase>(() => GetMealDetailsUseCase(sl()));
  sl.registerLazySingleton<SaveMealUseCase>(() => SaveMealUseCase(sl()));

  //Repositories
  sl.registerLazySingleton<FoodCategoriesRepository>(() => FoodCategoriesRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<MealByCategoryRepository>(() => MealByCategoryRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<SavedMealsRepository>(() => SavedMealsRepositoryImpl(sl()));


  //Data sources
  sl.registerLazySingleton<CategoriesRemoteDataSource>(() => CategoriesRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MealByCategoryRemoteDataSource>(() => MealByCategoryRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SavedMealsLocalDataSource>(() => SavedMealsLocalDataSourceImpl(sl()));



}

void initCore() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

Future<void> initExternal() async{

  //Shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //Dio
  sl.registerFactory<Dio>(() {
    Dio dio = Dio();
    dio.options.connectTimeout =  const Duration(seconds: 30);
    dio.options.receiveTimeout =  const Duration(seconds: 30);
    return dio;
  });

  //Network info
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //Database
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database.db')
      .build();

  sl.registerFactory(() => database);

}