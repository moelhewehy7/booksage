import 'package:dartz/dartz.dart';
import 'package:booksage/core/use_cases/use_case.dart';
import 'package:booksage/features/home/domain/entities/book_entity.dart';
import 'package:booksage/features/home/domain/repos/home_repo.dart';

import '../../../../core/errors/failures.dart';

class FetchBySearchUseCase extends UseCase<String> {
  final HomeRepo homerepo;

  FetchBySearchUseCase(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) async {
    return await homerepo.fetchBySearch(book: param!);
  }
}
