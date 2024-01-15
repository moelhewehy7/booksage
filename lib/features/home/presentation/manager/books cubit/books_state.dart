part of 'books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class BooksLoading extends BooksState {}

final class BooksFailure extends BooksState {
  final String errMessage;

  const BooksFailure({required this.errMessage});
}

final class BooksSuccess extends BooksState {
  final List<BookModel> books;

  const BooksSuccess({required this.books});
}
