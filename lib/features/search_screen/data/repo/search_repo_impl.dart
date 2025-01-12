import 'package:book_worm_hub/core/errors/failure.dart';
import 'package:book_worm_hub/core/utils/api_service.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/search_screen/data/repo/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> getAllBooks({
    required int startIndex,
    required int maxResults,
}) async {
    List<BookModel> allBooksList = [];
    try {
        var data = await apiService.get(
            endPoint:
                "volumes?Filtering=free-ebooks&q=all-books&startIndex=$startIndex&maxResults=$maxResults");

        List<dynamic> items = data['items'] ?? [];

        for (var item in items) {
          allBooksList.add(BookModel.fromJson(item));
        }
      return Right(allBooksList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
