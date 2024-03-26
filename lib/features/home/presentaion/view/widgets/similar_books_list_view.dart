import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/widgets/custom_error.dart';
import 'package:books_app/core/utils/widgets/custom_loading.dart';
import 'package:books_app/features/home/presentaion/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:books_app/features/home/presentaion/manger/similar_books_cubit/similar_books_states.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(builder:(context, state) {
      if(state is SimilarBooksSuccess){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>  Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
              },child: CustomListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? 'ada')),
            ),
          ),
        );
      } else if(state is SimilarBooksFailure){
        return CustomErrorWidget(errMessage: state.errorMessage);
      } else {
        return CustomLoadingIndicator();
      }
    },

    );
  }
}