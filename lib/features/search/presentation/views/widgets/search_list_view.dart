import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/core/utils/widgets/custom_error.dart';
import 'package:books_app/core/utils/widgets/custom_loading.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/home/presentaion/view/widgets/best_seller_list_view_item.dart';
import 'package:books_app/features/home/presentaion/view/widgets/book_rating.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_cubit.dart';
import 'package:books_app/features/search/presentation/manger/search_book_cubit/search_book_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                   GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                },
                child: SizedBox(
                  height: 125,
                  child: Row(
                    children: [
                      CustomListViewItem(
                          imageUrl: state
                              .books[index].volumeInfo.imageLinks?.thumbnail?? state
                              .books[index-1].volumeInfo.imageLinks!.thumbnail!),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(
                                state.books[index].volumeInfo!.title!,
                                style: Styles.textStyle20,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              state.books[index].volumeInfo!.authors?[0]?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle14,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Free',
                                  style: Styles.textStyle20,
                                ),
                                Spacer(),
                                BookRating(
                                    count: state.books[index].volumeInfo
                                            ?.ratingsCount ??
                                        0,
                                    rating: state.books[index].volumeInfo
                                            ?.averageRating ??
                                        0),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }else if(state is SearchBooksFailure){
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
