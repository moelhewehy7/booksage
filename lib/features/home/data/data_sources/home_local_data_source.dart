import 'package:hive_flutter/hive_flutter.dart';
import 'package:reading/constants.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pagenumber = 0});
  List<BookEntity> fetchNewstBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pagenumber = 0}) {
    int startindex = pagenumber * 10;
    int endindex = (pagenumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeautredbox);
    int length = box.values.length;
    // endindex 50 = 50>50 no so he will fetch item 49index
    // length 50 endindex 49= lastitem
    if (startindex >= length || endindex > length) {
      return [];
    }
    return box.values.toList().sublist(startindex, endindex);
  }

  @override
  List<BookEntity> fetchNewstBooks() {
    var box = Hive.box<BookEntity>(kNewestbox);
    return box.values.toList();
  }
}
