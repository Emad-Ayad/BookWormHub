import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/search_screen/presentation/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../HomeScreen/presentation/view/widgets/card_item.dart';

class ResultsGridView extends StatelessWidget {
  final List<BookModel> filteredBooks;
  final ScrollController scrollController;

  const ResultsGridView({
    super.key,
    required this.filteredBooks,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        // Scroll listener to trigger pagination when the user reaches the end
        scrollController.addListener(() {
          if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
            context.read<SearchCubit>().getAllBooks(isPagination: true);
          }
        });

        if (state is SearchSuccess) {
          return GridView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: filteredBooks.length + (state.isLoading ? 1 : 0), // Show loading indicator at the end
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              // Show a loading spinner at the end if we're loading more items
              if (index == filteredBooks.length && state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              return GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRouter.kDetailsRoute, extra: filteredBooks[index]);
                },
                child: CardItem(
                  imageUrl: filteredBooks[index].volumeInfo?.imageLinks?.thumbnail ?? "",
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}