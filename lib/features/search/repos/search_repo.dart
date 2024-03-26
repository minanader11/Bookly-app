import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>> fetchSearchBook({required String category});
}