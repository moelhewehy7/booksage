import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/use_cases/fetchfeaturedbooks_usecase.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call();
    result.fold(
        (failure) =>
            emit(FeaturedBooksFailure(errMessage: failure.errorMessage)),
        (books) => emit(FeaturedBooksSuccess(books: books)));
  }
}
