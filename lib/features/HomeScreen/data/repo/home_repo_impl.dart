import 'package:book_worm_hub/core/errors/failure.dart';
import 'package:book_worm_hub/core/utils/api_service.dart';

import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:dio/dio.dart';

import 'package:either_dart/src/either.dart';

import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=computer science &sorting=newest");

      List<BookModel> booksList = [];

      for (var item in data['items']) {
        booksList.add(BookModel.fromJson(item));
      }
      return Right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks() async{
    try {
      var data = await apiService.get(
          endPoint:
          "volumes?Filtering=free-ebooks&q=subject:Programming");

      List<BookModel> booksList = [];

      for (var item in data['items']) {
        booksList.add(BookModel.fromJson(item));
      }
      return Right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getSimilarBooks({required String category}) async{
    try {
      var data = await apiService.get(
          endPoint:
          "volumes?Filtering=free-ebooks&q=subject:$category&sorting=relevance");


      if (data == null || data['items'] == null) {
        return Right([]); // Return an empty list if no data found
      }
      List<BookModel> booksList = [];

      for (var item in data['items']) {
        booksList.add(BookModel.fromJson(item));
      }
      return Right(booksList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
