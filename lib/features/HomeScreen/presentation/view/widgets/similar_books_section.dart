import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/app_router.dart';
import 'card_item.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.book});

  final BookModel book;

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
        BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
          builder: (context, state) {
            if (state is SimilarBooksSuccess) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height * .17,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: (){
                          GoRouter.of(context)
                              .push(AppRouter.kDetailsRoute, extra: state.books[index]);
                        },
                        child: CardItem(
                          imageUrl: state.books[index].volumeInfo?.imageLinks?.thumbnail ?? "",
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is SimilarBooksFailure) {
              return ErrorWidget(state.errMessage);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
