import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_state.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_states.dart';
import 'package:books_app/features/search/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
class SearchBooksCubit extends Cubit<SearchBooksState>{
  SearchBooksCubit(this.searchRepo): super(SearchBooksInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchBooks({required String category}) async{
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBook(category: category);
    result.fold((failure) {

      emit(SearchBooksFailure('No Books Found'));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}