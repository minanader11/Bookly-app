import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_cubit.dart';
import 'package:books_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SearchBooksCubit>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchViewBody(),);
  }
}
