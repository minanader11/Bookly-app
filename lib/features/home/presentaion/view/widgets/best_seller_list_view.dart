import 'package:books_app/core/utils/widgets/custom_error.dart';
import 'package:books_app/core/utils/widgets/custom_loading.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentaion/manger/featured_books_cubit/featured_books_state.dart';
import 'package:books_app/features/home/presentaion/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_app/features/home/presentaion/manger/newest_books_cubit/newest_books_states.dart';
import 'package:books_app/features/home/presentaion/view/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(builder: (context, state) {
      if(state is NewestBooksSuccess){
        return  ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListViewItem(book: state.books[index]),

            );
          },
        );
      } else if(state is NewestBooksFailure){
        return CustomErrorWidget(errMessage: state.errorMessage);
      } else{
        return CustomLoadingIndicator();
      }
    }
    ,);

  }
}