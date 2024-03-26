import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/widgets/custom_error.dart';
import 'package:books_app/core/utils/widgets/custom_loading.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_state.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics:BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                },child: CustomListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail?? state.books[index-1].volumeInfo.imageLinks!.thumbnail)),
              ),
            ),
          );
        } else if(state is FeaturedBooksFailure){
             return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
         return CustomLoadingIndicator();
        }
      },
    );
  }
}
