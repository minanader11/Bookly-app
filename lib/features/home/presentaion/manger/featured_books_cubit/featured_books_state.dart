import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksState extends Equatable{
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}
class FeaturedBooksInitial extends FeaturedBooksState{}
class FeaturedBooksFailure extends FeaturedBooksState{
  String errorMessage;
  FeaturedBooksFailure(this.errorMessage);
}
class FeaturedBooksLoading extends FeaturedBooksState{}
class FeaturedBooksSuccess extends FeaturedBooksState {
  List<BookModel> books;
  FeaturedBooksSuccess(this.books);
}