import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reading/features/home/domain/repos/home_repo.dart';
import '../../../data/models/book_model/book_model.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homerepo) : super(NewestBooksInitial());
  final HomeRepo homerepo;
  Future<void> fetchnewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homerepo.fetchNewstBooks();
    result.fold(
        (failure) => emit(NewestBooksFailure(errMessage: failure.errorMessage)),
        (books) => emit(NewestBooksSuccess(books: books)));
  }
}
