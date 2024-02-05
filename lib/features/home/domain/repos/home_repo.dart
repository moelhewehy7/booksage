import 'package:dartz/dartz.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pagenumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks();
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      {required String categry});
  Future<Either<Failure, List<BookEntity>>> fetchBySearch(
      {required String book});
}
// The Repository Pattern in Flutter is a software design pattern 
// that abstracts the logic that retrieves data

