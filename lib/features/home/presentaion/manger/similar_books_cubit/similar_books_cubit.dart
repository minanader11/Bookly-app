import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/core/utils/api_service.dart';
import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentaion/manger/similar_books_cubit/similar_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>{
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitial());
  HomeRepo homeRepo;
  Future<void>  fetchSimilarBook({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBook(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }
    , (books) {
    emit(SimilarBooksSuccess(books));
  });
  }
}