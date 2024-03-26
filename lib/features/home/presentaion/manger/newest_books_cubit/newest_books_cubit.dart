import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_state.dart';
import 'package:books_app/features/home/presentaion/manger/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>{
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async{
   emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBook();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    } , (books){
      print(books.length.toString());
      emit(NewestBooksSuccess(books));
    } );
}
}