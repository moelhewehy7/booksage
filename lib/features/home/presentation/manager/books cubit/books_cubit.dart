import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/repos/home_repo.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homerepo) : super(BooksInitial());
  final HomeRepo homerepo;
  Future<void> fetchBooks() async {
    emit(BooksLoading());
    var result = await homerepo.fetchFeaturedBooks();
    result.fold(
        (failure) => emit(BooksFailure(errMessage: failure.errorMessage)),
        (books) => emit(BooksSuccess(books: books)));
  }
}
