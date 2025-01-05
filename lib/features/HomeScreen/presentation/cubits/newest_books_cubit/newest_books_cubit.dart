import 'package:bloc/bloc.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/HomeScreen/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    var results = await homeRepo.getNewestBooks();
    results.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
