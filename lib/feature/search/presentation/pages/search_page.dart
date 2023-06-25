import 'package:DishDash/core/di/injector_container.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/search/domain/model/search_results_model.dart';
import 'package:DishDash/feature/search/presentation/cubits/search_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Search for meals';

/*  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
      ),
    );
  }*/


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

  BlocProvider<SearchCubit> buildSearchResults(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<SearchCubit>(),
        child: BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
          switch (state.uiState) {
            case UIState.initial:
              dispatchSearchEvent(context, query);
              return Container();
            case UIState.loading:
              return const Center(child: CircularProgressIndicator());
            case UIState.success:
              return searchListWidget(state.results ?? []);
            case UIState.error:
              return const Center(child: Text('No results found'));
              case UIState.empty:
              return const Center(child: Text('No results found'));
            default:
              return Container();
          }
        }));
  }

  void dispatchSearchEvent(BuildContext context, String query) {
    BlocProvider.of<SearchCubit>(context).searchMeal(query);
  }

  Widget searchListWidget(List<SearchResultsModel> results) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final meal = results[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.2),
          ),
          height: 80,
          child: Row(
            children: [
              Container(
                width: 90,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(meal.strMealThumb ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 3,
                      meal.strMeal ?? '',
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17,),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults(context);
  }
}
