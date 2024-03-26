import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:equatable/equatable.dart';
abstract class NewestBooksState extends Equatable{
  const NewestBooksState();

  @override
  List<Object> get props => [];
}
class NewestBooksInitial extends NewestBooksState{}
class NewestBooksLoading extends NewestBooksState{}
class NewestBooksSuccess extends NewestBooksState{
  List<BookModel>books;
  NewestBooksSuccess(this.books);
}
class NewestBooksFailure extends NewestBooksState{
  String errorMessage;
  NewestBooksFailure(this.errorMessage);
}