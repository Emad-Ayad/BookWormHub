
import 'package:book_worm_hub/features/HomeScreen/presentation/view/widgets/rating.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import '../../../data/model/book_model.dart';
import 'book_button.dart';
import 'card_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.2),
          child:  CardItem(imageUrl:book.volumeInfo?.imageLinks?.thumbnail ?? " ",),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .02),
         Text(
           book.volumeInfo?.title ??"UnKnown",
          style: Styles.headline32,
           textAlign: TextAlign.center,
        ),
         Text(
          book.volumeInfo?.authors?[0] ??"UnKnown",
          style: Styles.bodyText14,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .03),
        const BookButton()
      ],
    );
  }
}