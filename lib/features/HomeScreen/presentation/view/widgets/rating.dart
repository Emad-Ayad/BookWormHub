import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/styles.dart';


class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key, required this.rating, required this.ratingCount,
  });

  final int rating;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '4.8',
            style: Styles.bodyText18,
          ),
        ),
        Text(
          '(2390)',
          style: Styles.bodyText14,
        )
      ],
    );
  }
}
