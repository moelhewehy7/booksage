import 'package:dartz/dartz.dart';

import '../../features/home/domain/entities/book_entity.dart';
import '../errors/failures.dart';

abstract class UseCase<Param> {
  Future<Either<Failure, List<BookEntity>>> call([Param parm]);
}

class NoParam {}
