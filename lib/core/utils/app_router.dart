import 'package:book_worm_hub/features/HomeScreen/presentation/view/details_screen.dart';
import 'package:book_worm_hub/features/HomeScreen/presentation/view/home_screen.dart';
import 'package:book_worm_hub/features/search_screen/presentation/view/search_screen.dart';
import 'package:book_worm_hub/features/splash_screen/presentation/view/splash_screen.dart';
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
        builder: (context, state) => const DetailsScreen(),
      ),
      GoRoute(
        path: kSearchRoute,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
