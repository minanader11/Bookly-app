import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchBooksState extends Equatable{
  const SearchBooksState();

  @override
  List<Object> get props => [];
}
class SearchBooksInitial extends SearchBooksState{}
class SearchBooksFailure extends SearchBooksState{
  String errorMessage;
  SearchBooksFailure(this.errorMessage);
}
class SearchBooksLoading extends SearchBooksState{}
class SearchBooksSuccess extends SearchBooksState {
  List<BookModel> books;
  SearchBooksSuccess(this.books);
}