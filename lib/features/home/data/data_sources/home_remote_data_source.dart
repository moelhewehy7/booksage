import 'package:reading/constants.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import '../../../../core/function/cache_books._data.dart';
import '../../../../core/utils/api._service.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewstBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endpoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=New");
    List<dynamic> bookslist = data["items"];
    List<BookEntity> books = [];
    for (var item in bookslist) {
      books.add(BookModel.fromJson(item));
    }
    cachebooksdata(books, kFeautredbox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewstBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=book:sport');
    List<dynamic> bookslist = data["items"];
    List<BookEntity> books = [];
    for (var item in bookslist) {
      books.add(BookModel.fromJson(item));
    }
    cachebooksdata(books, kNewestbox);
    return books;
  }
}
