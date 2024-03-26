import 'package:books_app/core/utils/assets.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/home/presentaion/view/widgets/best_seller_list_view.dart';
import 'package:books_app/features/home/presentaion/view/widgets/best_seller_list_view_item.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_app_bar.dart';
import 'package:books_app/features/home/presentaion/view/widgets/custom_list_view_item.dart';
import 'package:books_app/features/home/presentaion/view/widgets/featured_list_view.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedListView(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),

              ],
            ),
          ),
        ),
        SliverFillRemaining(child: BestSellerListView(),)
      ],
    );
  }
}


