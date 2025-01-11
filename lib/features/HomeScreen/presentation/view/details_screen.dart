import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/similar_books_cubit/similar_books_cubit.dart';
import 'widgets/books_detials_section.dart';
import 'widgets/custom_details_app_bar.dart';
import 'widgets/similar_books_section.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.book});

  final BookModel book;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .getSimilarBooks(category: widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const DetailsAppBar(),
                  BooksDetailsSection(
                    book: widget.book,
                  ),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * .04),
                   SimilarBooksSection(book: widget.book)
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
