import 'package:dartz/dartz.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
// The Repository Pattern in Flutter is a software design pattern 
// that abstracts the logic that retrieves data

