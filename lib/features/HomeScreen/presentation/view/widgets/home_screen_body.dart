import 'package:flutter/material.dart';
import '../../../../../core/constants/styles.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Best Seller",style: Styles.titleMedium),
        ),
      ],
    );
  }
}






