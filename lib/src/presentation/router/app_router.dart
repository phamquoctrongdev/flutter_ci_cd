import 'package:flutter/cupertino.dart';
import 'package:flutter_ci_cd/src/presentation/features/main_home/view/pages/main_home_page.dart';
import 'package:flutter_ci_cd/src/presentation/features/movie/view/pages/movie_detail_page.dart';
import 'package:flutter_ci_cd/src/presentation/features/movie/view/pages/movie_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String details = 'details';
  static const String movie = '/movie';
  static const String movieDetail = '/movie/details';
  static const String profileChildTemp = '/profile_child_temp';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: movie,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainHomePage(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: movie,
            builder: (context, state) {
              return const MoviePage();
            },
            routes: [
              GoRoute(
                path: details,
                builder: (context, state) {
                  return MovieDetailPage(text: state.extra as String);
                },
              ),
            ],
          ),
          GoRoute(
            path: profileChildTemp,
            builder: (context, state) {
              return const Center(
                child: Text('Profile child temp', key: Key('MyTextKey'),),
              );
            },
            parentNavigatorKey: _shellNavigatorKey,
          ),
        ],
      ),
    ],
  );
}
