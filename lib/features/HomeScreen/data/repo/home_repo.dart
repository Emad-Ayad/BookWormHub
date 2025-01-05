
import 'package:book_worm_hub/core/errors/failure.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:either_dart/either.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookModel>>> getFeaturedBooks();
  Future<Either<Failure,List<BookModel>>> getNewestBooks();
}
