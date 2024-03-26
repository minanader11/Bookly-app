import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:equatable/equatable.dart';
abstract class SimilarBooksState extends Equatable{
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}
class SimilarBooksInitial extends SimilarBooksState{}
class SimilarBooksLoading extends SimilarBooksState{}
class SimilarBooksSuccess extends SimilarBooksState{
  List<BookModel>books;
  SimilarBooksSuccess(this.books);
}
class SimilarBooksFailure extends SimilarBooksState{
  String errorMessage;
  SimilarBooksFailure(this.errorMessage);
}