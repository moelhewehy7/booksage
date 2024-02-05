import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchSimilarBooksUseCase extends UseCase<String> {
  final HomeRepo homerepo;

  FetchSimilarBooksUseCase(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    return await homerepo.fetchSimilarBooks(categry: param!);
  }
}
