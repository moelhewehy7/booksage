import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reading/core/errors/failures.dart';
import 'package:reading/core/utils/api._service.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import 'package:reading/features/home/domain/repos/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpel(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks() async {
    try {
      var data = await apiService.get(
          endpoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=New");
      List<dynamic> bookslist = data["items"];
      List<BookModel> books = [];
      for (var item in bookslist) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log('Error creating BookModel: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?Filtering=free-ebooks&q=book:sport');
      List<dynamic> bookslist = data["items"];
      List<BookModel> books = [];
      for (var item in bookslist) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log('Error creating BookModel: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      } else {
        return left(ServerFailure("Please try again later"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String categry}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$categry');
      List<dynamic> bookslist = data["items"];
      List<BookModel> books = [];
      for (var item in bookslist) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log('Error creating BookModel: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      } else {
        return left(ServerFailure("Please try again later"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchbysearch(
      {required String book}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=book:$book');
      List<dynamic> bookslist = data["items"];
      List<BookModel> books = [];
      for (var item in bookslist) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log('Error creating BookModel: $e');
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        // Assuming you have a method to handle DioError and convert it to ServerFailure
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        // Assuming you have a method to handle other errors and convert them to ServerFailure
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      } else {
        return left(ServerFailure("Please try again later"));
      }
    }
  }
}
// the inner try-catch block where you attempt to add a BookModel to the books list,
//  if an exception occurs, you're catching it and doing nothing (catch (e) {}).
//   This means that if there's an issue while parsing an individual book,
//  it will be silently ignored, and the loop will continue to the next iteration