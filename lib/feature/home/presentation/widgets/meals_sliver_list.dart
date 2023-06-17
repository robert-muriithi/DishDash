import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/presentation/bloc/meals/meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsSliverListDelegate extends SliverChildBuilderDelegate {
  MealsSliverListDelegate(super.builder);

  @override
  Widget build(BuildContext context, int index) {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        switch (state.uiState) {
          case UIState.initial:
            //dispatchEvent(context, 'Beef');
            return const Center(child: CircularProgressIndicator());
          case UIState.loading:
            return const Center(child: CircularProgressIndicator());
          case UIState.success:
            final meals = state.meals;
            final index = state.selectedIndex;
            return Container();
          case UIState.error:
            final exception = state.exception;
            return Center(child: Text(
              exception ?? '',
            ));
          default:
            return const Center(child: Text('No data found'));
        }
      },
    );
  }

}
