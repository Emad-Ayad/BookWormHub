part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;
  final bool isLoading;

  SearchSuccess({required this.books, required this.isLoading});
}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}
