import 'package:book_worm_hub/core/constants/constants.dart';
import 'package:book_worm_hub/core/utils/app_router.dart';
import 'package:book_worm_hub/core/utils/service_locator.dart';
import 'package:book_worm_hub/features/HomeScreen/data/repo/home_repo_impl.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const BookWormHub());
}

class BookWormHub extends StatelessWidget {
  const BookWormHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
