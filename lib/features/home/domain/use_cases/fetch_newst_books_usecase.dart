import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/use_case.dart';
import '../repos/home_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entities/book_entity.dart';

class FetchNewestBooksUseCase extends UseCase<int> {
  final HomeRepo homerepo;

  FetchNewestBooksUseCase(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    return await homerepo.fetchNewstBooks();
  }
}
