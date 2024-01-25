import 'package:hive_flutter/hive_flutter.dart';
import 'package:reading/constants.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewstBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeautredbox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewstBooks() {
    var box = Hive.box<BookEntity>(kNewestbox);
    return box.values.toList();
  }
}
