import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:DishDash/feature/saved/presentation/cubits/saved_meals_cubit.dart';
import 'package:DishDash/feature/saved/presentation/page/saved_meal_details.dart';
import 'package:DishDash/feature/saved/presentation/widgets/saved_meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SavedMealsCubit>()..getSavedMeals(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Saved Meals"),
        ),
        body: _buildBody(context),
      ),
    );
  }

  BlocConsumer<SavedMealsCubit, SavedMealsState> _buildBody(BuildContext context) {
    return BlocConsumer<SavedMealsCubit, SavedMealsState>(
      listener: (context, state) {
        if (state.uiState == UIState.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage ?? "Something went wrong"),
          ));
        }
      },
      builder: (context, state) {
        if (state.uiState == UIState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.uiState == UIState.success) {
          return ListView.builder(
            itemCount: state.savedMeals?.length,
            itemBuilder: (context, index) {
              final meal = state.savedMeals?[index] ?? SavedFoodModel();
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedMealDetailsPage(
                        meal: meal,
                      ),
                    ),
                  );
                },
                child: SavedMealItem(
                  meal: meal,
                  onDelete: (String mealId) {
                    context.read<SavedMealsCubit>().deleteSavedMeal(mealId);
                  },
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
