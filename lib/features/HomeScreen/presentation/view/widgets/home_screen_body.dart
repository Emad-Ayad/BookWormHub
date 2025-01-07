import 'package:flutter/material.dart';
import '../../../../../core/constants/styles.dart';
import 'best_seller_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Best Seller", style: Styles.bodyText18),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
            child: BestSellerBooksListView()
        )
      ],
    );
  }
}



