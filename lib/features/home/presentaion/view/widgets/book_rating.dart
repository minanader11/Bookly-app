import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  BookRating({super.key, this.mainAxisAlignment=MainAxisAlignment.start,required this.count,required this.rating});
MainAxisAlignment mainAxisAlignment;
num rating;
num count;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment:mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar,color: Color(0xffFFDD4F),size: 15,),
        SizedBox(width: 6.3,),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),SizedBox(width: 5,),
        Text(
          '(${count.toString()})',
          style: Styles.textStyle14.copyWith(color: Color(0xff707070)),
        )
      ],
    );
  }
}