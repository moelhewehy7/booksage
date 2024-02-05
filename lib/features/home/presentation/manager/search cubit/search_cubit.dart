import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/use_cases/fetch_by_search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchBySearchUseCase) : super(SearchInitial());
  final FetchBySearchUseCase fetchBySearchUseCase;
  Future<void> fetchBookbysearch({required String book}) async {
    emit(SearchLoading());
    var result = await fetchBySearchUseCase.call(book);
    result.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errorMessage)),
        (books) => emit(SearchSuccess(books: books)));
  }
}
