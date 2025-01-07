import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../HomeScreen/presentation/view/widgets/best_seller_item.dart';

class ResultsListView extends StatelessWidget {
  const ResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          // child: BestSellerItems(newestBooks: ),
        );
      },
    );
  }
}
