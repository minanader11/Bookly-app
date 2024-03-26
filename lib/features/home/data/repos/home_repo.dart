import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:dartz/dartz.dart';
abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>> fetchNewestBook();
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBook();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBook({required String category});
}