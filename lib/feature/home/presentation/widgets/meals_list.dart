import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/presentation/cubits/meals/meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsList extends StatelessWidget {
  MealsList({Key? key}) : super(key: key);

  BuildContext? blocContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildBody(context),
    );
  }

  BlocProvider<MealsCubit> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MealsCubit>(),
      child: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state) {
          blocContext = context;
          switch (state.uiState) {
            case UIState.initial:
              dispatchEvent(context, 'Beef');
              return const Center(child: CircularProgressIndicator());
            case UIState.loading:
              return const Center(child: CircularProgressIndicator());
            case UIState.success:
              final meals = state.meals;
              final index = state.selectedIndex;
              return mealsListWidget(
                meals: meals,
                index: index,
              );
            case UIState.error:
              final exception = state.exception;
              return Center(child: Text(
                exception ?? '',
              ));
            default:
              return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }

  Widget mealsListWidget(
      {required List<MealByCategoryModel> meals, required int index}) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return Container(
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(meal.strMealThumb),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                meal.strMeal,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void dispatchEvent(BuildContext context, String category) {
    BlocProvider.of<MealsCubit>(context).fetchMealsByCategory(category);
  }
}



