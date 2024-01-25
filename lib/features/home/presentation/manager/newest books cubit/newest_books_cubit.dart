import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/use_cases/fetchnewstbooks_usecase.dart';
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
