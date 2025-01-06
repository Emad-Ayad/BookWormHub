import 'package:flutter/material.dart';

import '../../../../../core/constants/styles.dart';
import 'card_item.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "You can also like ",
          style: Styles.bodyText18,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .01),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .17,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(5.0),
                child: CardItem(imageUrl: 'https://www.casualoptimist.com/wp-content/uploads/2024/03/understory-design-emily-mahon-scaled.jpg',),
              );
            },
          ),
        )
      ],
    );
  }
}