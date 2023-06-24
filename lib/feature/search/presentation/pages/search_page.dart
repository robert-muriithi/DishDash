

import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/search/domain/model/search_results_model.dart';
import 'package:DishDash/feature/search/presentation/cubits/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults(context);
  }

  BlocProvider<SearchCubit> buildSearchResults(BuildContext context){
    return BlocProvider(
        create: (_) => sl<SearchCubit>(),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            switch(state.uiState) {
              case UIState.initial:
                dispatchSearchEvent(context, query);
                return Container();
              case UIState.loading:
                return const Center(child: CircularProgressIndicator());
              case UIState.success:
                return searchListWidget(state.results ?? []);
              case UIState.error:
                return Center(child: Text(state.message ?? 'An error occurred'));
              default:
                return Container();
            }

          }
        ));
  }

  void dispatchSearchEvent(BuildContext context, String query) {
    BlocProvider.of<SearchCubit>(context).searchMeal(query);
  }

  Widget searchListWidget(List<SearchResultsModel> results) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, results[index]);
        },
        leading: const Icon(Icons.fastfood),
        title: Text(results[index].strMeal ?? ''),
      ),
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults(context);
  }

}