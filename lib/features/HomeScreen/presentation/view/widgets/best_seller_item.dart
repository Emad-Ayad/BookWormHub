import 'package:book_worm_hub/core/utils/app_router.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/styles.dart';

class BestSellerItems extends StatelessWidget {
  const BestSellerItems({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kDetailsRoute,extra: book);
        },
        child: SizedBox(
          height: 110,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 2.8 / 4,
                  child: CachedNetworkImage(
                    imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.volumeInfo!.title!,
                      style: Styles.headline20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.volumeInfo!.authors![0],
                      style: Styles.bodyText14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2,),
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
