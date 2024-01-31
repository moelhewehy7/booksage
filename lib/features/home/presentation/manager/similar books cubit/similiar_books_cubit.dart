import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/use_cases/fetchSimilarBooks_usecase.dart';
part 'similiar_books_state.dart';

class SimiliarBooksCubit extends Cubit<SimiliarBooksState> {
  SimiliarBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimiliarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  Future<void> fetchSimiliarBooks({required String category}) async {
    emit(SimiliarBooksLoading());
    var result = await fetchSimilarBooksUseCase.call(category);
    result.fold(
        (failure) =>
            emit(SimiliarBooksFailure(errMessage: failure.errorMessage)),
        (books) => emit(SimiliarBooksSuccess(books: books)));
  }
}
