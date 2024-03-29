import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repos/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final HomeRemoteDataSource homeremotedatasource;
  final HomeLocalDataSource homelocaldatasource;
  HomeRepoImpel(
      {required this.homeremotedatasource, required this.homelocaldatasource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pagenumber = 0}) async {
    try {
      List<BookEntity> cachedbook =
          homelocaldatasource.fetchFeaturedBooks(pagenumber: pagenumber);
      if (cachedbook.isNotEmpty) {
        return right(cachedbook);
      }
      List<BookEntity> books =
          await homeremotedatasource.fetchFeaturedBooks(pagenumber: pagenumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        return left(ServerFailure("Please try again later"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks() async {
    try {
      // List<BookEntity> cachedbook = homelocaldatasource.fetchNewstBooks();
      // if (cachedbook.isNotEmpty) {
      //   return right(cachedbook);
      // }
      List<BookEntity> books = await homeremotedatasource.fetchNewstBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        return left(ServerFailure("Please try again later"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String categry}) async {
    try {
      List<BookEntity> books =
          await homeremotedatasource.fetchSimilarBooks(categry: categry);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        return left(ServerFailure("Please try again later"));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBySearch({
    required String book,
  }) async {
    try {
      List<BookEntity> books =
          await homeremotedatasource.fetchBySearch(book: book);

      if (books.isEmpty) {
        // Return a custom failure indicating no results found
        return left(ServerFailure("No books found for the given search."));
      } else {
        return right(books);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else if (e is DioException) {
        return left(ServerFailure.fromResponse(
            e.response!.statusCode, e.response!.data));
      } else {
        return left(ServerFailure("No books found for the given search."));
      }
    }
  }
}

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchbysearch(
//       {required String book}) async {
//     try {
//       var data = await apiService.get(
//           endpoint:
//               'volumes?Filtering=free-ebooks&Sorting=relevance&q=book:$book');
//       List<dynamic> bookslist = data["items"];
//       List<BookModel> books = [];
//       for (var item in bookslist) {
//         try {
//           books.add(BookModel.fromJson(item));
//         } catch (e) {
//           log('Error creating BookModel: $e');
//         }
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         // Assuming you have a method to handle DioError and convert it to ServerFailure
//         return left(ServerFailure.fromDioException(e));
//       } else if (e is DioException) {
//         // Assuming you have a method to handle other errors and convert them to ServerFailure
//         return left(
//             ServerFailure.fromResponse(e.response?.statusCode, e.response));
//       } else {
//         return left(ServerFailure("Please try again later"));
//       }
//     }
//   }
// }
// the inner try-catch block where you attempt to add a BookModel to the books list,
//  if an exception occurs, you're catching it and doing nothing (catch (e) {}).
//   This means that if there's an issue while parsing an individual book,
//  it will be silently ignored, and the loop will continue to the next iteration

    // try {
    //   var data = await apiService.get(
    //       endpoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=New");
    //   List<dynamic> bookslist = data["items"];
    //   List<BookModel> books = [];
    //   for (var item in bookslist) {
    //     try {
    //       books.add(BookModel.fromJson(item));
    //     } catch (e) {
    //       log('Error creating BookModel: $e');
    //     }
    //   }
    //   return right(books);
    // } catch (e) {
    //   if (e is DioException) {
    //     return left(ServerFailure.fromDioException(e));
    //   }
    //   return left(ServerFailure(e.toString()));
    // }