import 'package:book_worm_hub/core/constants/styles.dart';
import 'package:book_worm_hub/features/search_screen/presentation/view/widgets/results_list_view.dart';
import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomSearchTextField(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Results',
                      style: Styles.bodyText18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child:ResultsListView()
            ,
          )
        ],
      ),
    );
  }
}
