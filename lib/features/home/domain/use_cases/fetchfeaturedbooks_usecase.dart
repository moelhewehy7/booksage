import 'package:dartz/dartz.dart';
import 'package:reading/core/use_cases/use_case.dart';
import 'package:reading/features/home/domain/repos/home_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooks extends UseCase<int> {
  final HomeRepo homerepo;

  FetchFeaturedBooks(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    return await homerepo.fetchFeaturedBooks();
  }
}
