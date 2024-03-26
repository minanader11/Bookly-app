import 'package:books_app/core/errors/failure.dart';
import 'package:books_app/core/utils/api_service.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/search/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo{
  SearchRepoImpl({required this.apiService});
  ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBook({required String category}) async {
    try {
      var data =
          await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  }

