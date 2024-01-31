import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookid;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num? avgrating;
  @HiveField(7)
  final String? category;
  @HiveField(8)
  final String? preview;

  BookEntity(
      {required this.bookid,
      required this.preview,
      required this.avgrating,
      required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.category});
}
