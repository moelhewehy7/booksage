import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:reading/core/errors/failures.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import 'package:reading/features/home/data/repos/home_repo.dart';

class HomeRepoImpel implements HomeRepo {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBook() async {
    Response response = await dio
        .get("https://www.googleapis.com/books/v1/volumes?q=programming");
    Map<String, dynamic> resonsedata = response.data;
    List<dynamic> bookslist = resonsedata["items"];
    List<BookModel> Booksmodel = [];
    for (var book in bookslist) {
      Booksmodel.add(BookModel.fromJson(book));
    }

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
