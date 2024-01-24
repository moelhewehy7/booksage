import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../domain/repos/home_repo.dart';

part 'similiar_books_state.dart';

class SimiliarBooksCubit extends Cubit<SimiliarBooksState> {
  SimiliarBooksCubit(this.homerepo) : super(SimiliarBooksInitial());
  final HomeRepo homerepo;
  Future<void> fetchSimiliarBooks({required String category}) async {
    emit(SimiliarBooksLoading());
    var result = await homerepo.fetchSimilarBooks(categry: category);
    result.fold(
        (failure) =>
            emit(SimiliarBooksFailure(errMessage: failure.errorMessage)),
        (books) => emit(SimiliarBooksSuccess(books: books)));
  }
}
