import 'package:book_worm_hub/core/utils/service_locator.dart';
import 'package:book_worm_hub/features/search_screen/data/repo/search_repo_impl.dart';
import 'package:book_worm_hub/features/search_screen/presentation/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(getIt.get<SearchRepoImpl>())..getAllBooks(),
        child: SearchScreenBody(),
      ),
    );
  }
}
