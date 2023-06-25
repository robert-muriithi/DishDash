part of 'search_cubit.dart';

 class SearchState extends Equatable {
    final List<SearchResultsModel>? results;
    final UIState uiState;
    final String? message;
  const SearchState({this.results, this.uiState = UIState.initial, this.message});

  @override
  List<Object?> get props => [ results, uiState, message];

  SearchState copyWith({
    List<SearchResultsModel>? results,
    UIState? uiState,
    String? message,
  }) {
    return SearchState(
      results: results ?? this.results,
      uiState: uiState ?? this.uiState,
      message: message ?? this.message,
    );
  }
}


