import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reading/core/errors/failures.dart';
import 'package:reading/core/utils/api._service.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import 'package:reading/features/home/data/repos/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks() async {
    try {
      var data = await ApiService().get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');
      List<dynamic> bookslist = data["items"];
      List<BookModel> books = [];
      for (var item in bookslist) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await ApiService()
          .get(endpoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<dynamic> bookslist = data["items"];
      List<BookModel> books = [];
      for (var item in bookslist) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
