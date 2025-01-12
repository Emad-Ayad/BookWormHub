import 'package:either_dart/either.dart';

import '../../../../core/errors/failure.dart';
import '../../../HomeScreen/data/model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> getAllBooks({
    required int startIndex,
    required int maxResults,
  });
}
