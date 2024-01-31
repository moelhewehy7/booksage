import 'package:hive_flutter/hive_flutter.dart';

import '../../features/home/domain/entities/book_entity.dart';

void cachebooksdata(List<BookEntity> books, String boxname) {
  var box = Hive.box<BookEntity>(boxname);
  box.addAll(books);
}
