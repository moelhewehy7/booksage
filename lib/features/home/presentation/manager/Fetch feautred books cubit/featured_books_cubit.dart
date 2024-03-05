import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksage/features/home/domain/entities/book_entity.dart';
import 'package:booksage/features/home/domain/use_cases/fetch_featured_books_usecase.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchfeaturedBooks({int pagenumber = 0}) async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call(pagenumber);
    result.fold((failure) {
      emit(FeaturedBooksFailure(errMessage: failure.errorMessage));
    }, (books) => emit(FeaturedBooksSuccess(books: books)));
  }
}



// pagination
//class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
//   FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

//   final FetchFeaturedBooksUseCase featuredBooksUseCase;
//   Future<void> fetchfeaturedBooks({int pagenumber = 0}) async {
//     if (pagenumber == 0) {
//       emit(FeaturedBooksLoading());
//     } else {
//       emit(FeaturedBooksPaginationLoading());
//     }
//     var result = await featuredBooksUseCase.call(pagenumber);
//     result.fold((failure) {
//       if (pagenumber == 0) {
//         emit(FeaturedBooksFailure(errMessage: failure.errorMessage));
//       } else {
//         emit(FeaturedBooksPaginationFailure(errMessage: failure.errorMessage));
//       }
//     }, (books) => emit(FeaturedBooksSuccess(books: books)));
//   }
// }