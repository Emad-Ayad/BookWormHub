import 'package:book_worm_hub/core/utils/app_router.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/widgets/rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/styles.dart';

class BestSellerItems extends StatelessWidget {
  const BestSellerItems({super.key, required this.newestBooks});

  final BookModel newestBooks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kDetailsRoute);
        },
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 2.7 / 4,
                  child: CachedNetworkImage(
                    imageUrl: newestBooks.volumeInfo!.imageLinks!.thumbnail!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newestBooks.volumeInfo!.title!,
                      style: Styles.headline20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                     newestBooks.volumeInfo!.authors![0],
                      style: Styles.bodyText14,
                    ),
                    const SizedBox(height: 5,),
                    const Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.headline20,
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
