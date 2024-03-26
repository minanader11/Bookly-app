import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/home/presentaion/view/widgets/book_action.dart';
import 'package:books_app/features/home/presentaion/view/widgets/book_details_list_view.dart';
import 'package:books_app/features/home/presentaion/view/widgets/book_rating.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_book_details_appbar.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:books_app/features/home/presentaion/view/widgets/similar_books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .15),
                  child: CustomListViewItem(
                    imageUrl: book.volumeInfo.imageLinks!.thumbnail,
                  ),
                ),
                SizedBox(
                  height: 43,
                ),
                Text(
                  book.volumeInfo!.title ?? '',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle18
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                BookRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                    rating: book.volumeInfo.averageRating ?? 0,
                    count: book.volumeInfo.ratingsCount ?? 0),
                SizedBox(
                  height: 20,
                ),
                BookAction(book: book),
                Expanded(
                  child: SizedBox(
                    height: 49,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SimilarBooksListView(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
