import 'package:dartz/dartz.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBook();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
