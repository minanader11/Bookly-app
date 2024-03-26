import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/assets.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:books_app/features/home/presentaion/view/widgets/book_rating.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  BestSellerListViewItem({super.key, required this.book});

  BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomListViewItem(imageUrl: book.volumeInfo.imageLinks!.thumbnail),
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
                      book.volumeInfo.title!,
                      style: Styles.textStyle20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.volumeInfo.authors![0],
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
                          count: book.volumeInfo.ratingsCount ?? 0,
                          rating: book.volumeInfo.averageRating ?? 0),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
