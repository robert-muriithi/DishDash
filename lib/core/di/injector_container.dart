import 'package:DishDash/core/data/local/database/saved_meal_db.dart';
import 'package:DishDash/core/network/network.dart';
import 'package:DishDash/feature/auth/domain/usecase/reset_password_usecase.dart';
import 'package:DishDash/feature/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:DishDash/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:DishDash/feature/auth/presentation/cubit/sign_in_with_google_cubit.dart';
import 'package:DishDash/feature/auth/presentation/cubit/toggle_password_cubit.dart';
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
import 'package:DishDash/feature/onboarding/data/datasource/sharedprefs_local_data_source.dart';
import 'package:DishDash/feature/onboarding/data/respository/onboarding_repository_impl.dart';
import 'package:DishDash/feature/onboarding/domain/respository/onboarding_repository.dart';
import 'package:DishDash/feature/onboarding/domain/usecase/set_onboarding_status_usecase.dart';
import 'package:DishDash/feature/onboarding/presentation/cubits/onboarding_status_cubit.dart';
import 'package:DishDash/feature/saved/data/datasource/saved_meals_local_data_source.dart';
import 'package:DishDash/feature/saved/data/repository/saved_meals_repository_impl.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:DishDash/feature/saved/domain/usecase/delete_saved_meal_usecase.dart';
import 'package:DishDash/feature/saved/domain/usecase/get_saved_meals.dart';
import 'package:DishDash/feature/saved/presentation/cubits/saved_meals_cubit.dart';
import 'package:DishDash/feature/search/data/datasource/search_remote_data_source.dart';
import 'package:DishDash/feature/search/data/repository/search_repository_impl.dart';
import 'package:DishDash/feature/search/domain/repository/search_repository.dart';
import 'package:DishDash/feature/search/domain/usecase/search_meal_usecase.dart';
import 'package:DishDash/feature/search/presentation/cubits/search_cubit.dart';
import 'package:DishDash/feature/settings/presentation/bloc/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:DishDash/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:DishDash/feature/auth/data/datasource/auth_local_data_source.dart';
import 'package:DishDash/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:DishDash/feature/auth/domain/repository/auth_repository.dart';
import 'package:DishDash/feature/auth/domain/usecase/google_sign_in_usecase.dart';
import 'package:DishDash/feature/auth/domain/usecase/register_usecase.dart';
import 'package:DishDash/feature/auth/domain/usecase/login_use_case.dart';
import 'package:DishDash/feature/auth/presentation/cubit/login_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
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
  sl.registerFactory<SavedMealsCubit>(() => SavedMealsCubit(sl()));
  sl.registerFactory<OnboardingStatusCubit>(() => OnboardingStatusCubit(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerFactory<SignInWithGoogleCubit>(() => SignInWithGoogleCubit(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerFactory<TogglePasswordCubit>(() => TogglePasswordCubit());
  sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));
  sl.registerFactory<SearchCubit>(() => SearchCubit(sl()));
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());


  //Use cases
  sl.registerLazySingleton<GetFoodCategoriesUsCase>(
      () => GetFoodCategoriesUsCase(sl()));
  sl.registerLazySingleton<GetMealsByCategoryUseCase>(
      () => GetMealsByCategoryUseCase(sl()));
  sl.registerLazySingleton<GetMealDetailsUseCase>(
      () => GetMealDetailsUseCase(sl()));
  sl.registerLazySingleton<SaveMealUseCase>(() => SaveMealUseCase(sl()));
  sl.registerLazySingleton<GetSavedMealsUseCase>(
      () => GetSavedMealsUseCase(sl()));
  sl.registerLazySingleton<DeleteSavedUseCase>(() => DeleteSavedUseCase(sl()));
  sl.registerLazySingleton<SetOnboardingStatusUsCase>(
      () => SetOnboardingStatusUsCase(sl()));
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(sl()));
  sl.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton<SearchMealUseCase>(
      () => SearchMealUseCase(sl()));

  //Repositories
  sl.registerLazySingleton<FoodCategoriesRepository>(
      () => FoodCategoriesRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<MealByCategoryRepository>(
      () => MealByCategoryRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<SavedMealsRepository>(
      () => SavedMealsRepositoryImpl(sl()));
  sl.registerLazySingleton<OnBoardingScreensRepository>(
      () => OnBoardingScreensRepositoryImpl(localDataSource: sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(sl()));

  //Data sources
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<MealByCategoryRemoteDataSource>(
      () => MealByCategoryRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SavedMealsLocalDataSource>(
      () => SavedMealsLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(sl()));
}

void initCore() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

Future<void> initExternal() async {
  //Shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //Firebase Auth
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);

  //Dio
  sl.registerFactory<Dio>(() {
    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return dio;
  });

  //Network info
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerFactory(() => database);
}
