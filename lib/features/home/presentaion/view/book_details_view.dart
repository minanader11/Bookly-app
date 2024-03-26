import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/home/presentaion/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_app/features/home/presentaion/view/widgets/Book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key,required this.bookModel});
final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBook(category: widget.bookModel.volumeInfo.categories![0]);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BookDetailsViewBody(book: widget.bookModel),));
  }
}
