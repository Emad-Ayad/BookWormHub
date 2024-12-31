import 'package:book_worm_hub/core/constants/styles.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/widgets/card_item.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/widgets/rating.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_button.dart';
import 'books_detials_section.dart';
import 'custom_details_app_bar.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const DetailsAppBar(),
                  const BooksDetailsSection(),
                  Expanded(
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04)),
                  const SimilarBooksSection()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


