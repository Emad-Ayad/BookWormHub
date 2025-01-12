import 'package:book_worm_hub/core/constants/styles.dart';
import 'package:book_worm_hub/features/search_screen/presentation/view/widgets/results_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../HomeScreen/data/model/book_model.dart';
import '../../../data/repo/search_repo_impl.dart';
import '../../search_cubit/search_cubit.dart';
import 'custom_search_text_field.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<BookModel> allBooks = [];
  List<BookModel> filteredBooks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initial load
    context.read<SearchCubit>().getAllBooks();

    // Add scroll listener to trigger lazy loading
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !isLoading) {
        context.read<SearchCubit>().getAllBooks(isPagination: true);
      }
    });
  }

  void filterBooks(String query) {
    // Filter the books based on the search query
    final filtered = allBooks.where((book) {
      final title = book.volumeInfo?.title?.toLowerCase() ?? '';
      final authors = book.volumeInfo?.authors?.join(', ').toLowerCase() ?? '';
      return title.contains(query.toLowerCase()) ||
          authors.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredBooks = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomSearchTextField(
              searchController: searchController,
              onSearchChanged: (query) {
                filterBooks(query); // Filter the list when search text changes
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            const Text(
              'Results',
              style: Styles.bodyText18,
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    allBooks = state.books; // Update allBooks
                    filteredBooks = searchController.text.isEmpty
                        ? allBooks
                        : filteredBooks;

                    return ResultsGridView(
                      filteredBooks: filteredBooks,
                      scrollController: _scrollController,
                    );
                  } else if (state is SearchFailure) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}