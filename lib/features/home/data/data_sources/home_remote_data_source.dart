import 'dart:async';

import 'package:booksage/constants.dart';
import 'package:booksage/features/home/data/models/book_model/book_model.dart';
import '../../../../core/function/cache_books._data.dart';
import '../../../../core/utils/api._service.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pagenumber = 0});
  Future<List<BookEntity>> fetchNewstBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String categry});
  Future<List<BookEntity>> fetchBySearch({required String book});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pagenumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            "volumes?Filtering=free-ebooks&q=programming&startindex=${pagenumber * 10}");
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
        endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=Trending');
    List<dynamic> bookslist = data["items"];
    List<BookEntity> books = [];
    for (var item in bookslist) {
      books.add(BookModel.fromJson(item));
    }
    cachebooksdata(books, kNewestbox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String categry}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$categry');
    List<dynamic> bookslist = data["items"];
    List<BookModel> books = [];
    for (var item in bookslist) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchBySearch({required String book}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=book:$book');
    List<dynamic> bookslist = data["items"];
    List<BookModel> books = [];
    for (var item in bookslist) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
