import 'package:book_worm_hub/core/utils/service_locator.dart';
import 'package:book_worm_hub/features/HomeScreen/data/model/book_model.dart';
import 'package:book_worm_hub/features/HomeScreen/data/repo/home_repo_impl.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/details_screen.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/home_screen.dart';
import 'package:book_worm_hub/features/search_screen/presentation/view/search_screen.dart';
import 'package:book_worm_hub/features/splash_screen/presentation/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeRoute = '/home_screen';
  static const kSearchRoute = '/search_screen';
  static const kDetailsRoute = '/details_screen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kDetailsRoute,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child:  DetailsScreen(book: state.extra as BookModel,),
            ),
      ),
      GoRoute(
        path: kSearchRoute,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
