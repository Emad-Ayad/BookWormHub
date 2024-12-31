
import 'package:book_worm_hub/features/HomeScreen/presentation/view/widgets/rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import 'book_button.dart';
import 'card_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.2),
          child: const CardItem(),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .02),
        const Text(
          "The Soul Book",
          style: Styles.headline32,
        ),
        const Text(
          "The Soul Book",
          style: Styles.bodyText18,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .018),
        const RatingWidget(),
        SizedBox(height: MediaQuery.sizeOf(context).height * .03),
        const BookButton()
      ],
    );
  }
}