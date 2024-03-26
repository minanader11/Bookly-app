import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>  Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomListViewItem(imageUrl: 'https://unsplash.com/s/photos/photo'),
        ),
      ),
    );
  }
}