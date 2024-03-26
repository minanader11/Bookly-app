import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.homeRepo): super(FeaturedBooksInitial());
 final HomeRepo homeRepo;
 Future<void> fetchFeaturedBooks() async{
   emit(FeaturedBooksLoading());
   var result = await homeRepo.fetchFeaturedBook();
   result.fold((failure) {

     emit(FeaturedBooksFailure(failure.errMessage));
   }, (books) {
     emit(FeaturedBooksSuccess(books));
   });
}
}