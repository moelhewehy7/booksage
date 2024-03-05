import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksage/features/home/domain/entities/book_entity.dart';
import 'package:booksage/features/home/domain/use_cases/fetch_newst_books_usecase.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchnewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
        (failure) => emit(NewestBooksFailure(errMessage: failure.errorMessage)),
        (books) => emit(NewestBooksSuccess(books: books)));
  }
}
