import 'package:bloc/bloc.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/search_screen/data/repo/search_repo.dart';
import 'package:meta/meta.dart';


part 'search_state.dart';
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  List<BookModel> allBooks = [];
  bool isLoading = false;
  int startIndex = 0;
  final int maxResults = 40;

  Future<void> getAllBooks({bool isPagination = false}) async {
    if (isLoading) return;

    isLoading = true;
    if (!isPagination) {
      emit(SearchInitial());
    }

    var results = await searchRepo.getAllBooks(
      startIndex: startIndex,
      maxResults: maxResults,
    );

    results.fold(
          (failure) {
        emit(SearchFailure(failure.errMessage));
      },
          (books) {
        if (books.isEmpty && isPagination) {
          emit(SearchLoading()); // No more books to load
        } else {
          allBooks.addAll(books); // Add new books to the existing list
          startIndex += maxResults;
          emit(SearchSuccess(books: allBooks, isLoading: false));
        }
      },
    );

    isLoading = false;
  }
}