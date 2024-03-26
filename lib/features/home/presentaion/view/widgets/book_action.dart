import 'package:books_app/core/utils/function/custom_launch_url.dart';
import 'package:books_app/core/utils/widgets/custom_button.dart';
import 'package:books_app/features/home/data/model/Book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {},
            backgroundColor: Color(0xffFFFFFF),
            textColor: Color(0xff000000),
            text: 'Free',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              customLaunchUrl(book.volumeInfo!.previewLink!);
            },
            backgroundColor: Color(0xffEF8262),
            textColor: Color(0xffFFFFFF),
            text: 'Free Preview',
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
          ),
        ),
      ],
    );
  }
}
