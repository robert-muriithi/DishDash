
import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/presentation/bloc/categories/categories_cubit.dart';
import 'package:DishDash/feature/home/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategoriesHeaderDelegate extends SliverPersistentHeaderDelegate {

  BuildContext? blocContext;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          blocContext = context;
          switch(state.uiState) {
            case UIState.loading:
              return const Center(child: CircularProgressIndicator());
            case UIState.success:
              final categories = state.categories;
              return CategoriesList(
                categories: categories,
              );
            case UIState.error:
              final exception = state.exception;
              return  Center(child: Text(
                exception ?? '',
              ));
            default:
              return const Center(child: Text('No data found'));
          }
        }
    );
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}