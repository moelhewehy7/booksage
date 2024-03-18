import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repos/home_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<int> {
  final HomeRepo homerepo;

  FetchFeaturedBooksUseCase(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homerepo.fetchFeaturedBooks(pagenumber: param);
  }
}
