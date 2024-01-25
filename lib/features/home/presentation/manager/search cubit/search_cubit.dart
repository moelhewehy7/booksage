import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBookbysearch({required String book}) async {
    emit(SearchLoading());
    // var result = await homeRepo.fetchbysearch(book: book);
    // result.fold(
    //     (failure) => emit(SearchFailure(errMessage: failure.errorMessage)),
    //     (books) => emit(SearchSuccess(books: books)));
  }
}
