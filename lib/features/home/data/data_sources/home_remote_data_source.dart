import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewstBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewstBooks() {
    // TODO: implement fetchNewstBooks
    throw UnimplementedError();
  }
}
