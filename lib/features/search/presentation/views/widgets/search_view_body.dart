import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/core/utils/widgets/custom_error.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_cubit.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_states.dart';
import 'package:books_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:books_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Search Results',
              style: Styles.textStyle18,
            ),
            BlocBuilder<SearchBooksCubit,SearchBooksState>(builder: (context, state) {
              if(state is SearchBooksSuccess){
                return  Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: SearchListView()),
                    ],
                  ),
                );

              } else if (state is SearchBooksLoading){
                return Text('please search for books');
              } else if (state is SearchBooksFailure){
                return CustomErrorWidget(errMessage: state.errorMessage);

              } else {
                return Container();
              }
            },),


          ],
        ),
      ),
    );
  }
}
