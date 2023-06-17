import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/presentation/widgets/loading/loading_widget.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/presentation/bloc/meal_details_cubit.dart';
import 'package:DishDash/feature/home/presentation/widgets/meal_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPage extends StatelessWidget {
  final String id;

  const MealDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MealDetailsCubit>()..fetchMealDetails(id),
        ),
      ],
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<MealDetailsCubit, MealDetailsState>(
      listener: (context, state) {
        if (state.uiState == UIState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.exception!),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.uiState) {
          case UIState.loading:
            return const Center(child: LoadingWidget());
          case UIState.success:
            final meal = state.mealDetails;
            return MealDetailsWidget(
              meal: meal,
            );
          case UIState.error:
            return Center(
              child: Text(state.exception ?? ''),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
