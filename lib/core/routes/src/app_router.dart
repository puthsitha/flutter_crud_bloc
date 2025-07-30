import 'package:crud_api/core/routes/src/not_found_screen.dart';
import 'package:crud_api/features/home/home.dart';
import 'package:crud_api/features/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Pages {
  // Splash
  splash,
  //app
  app,
  //home
  home,
}

class AppRouter {
  AppRouter();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (kDebugMode) {
        print('route fullPath : ${state.fullPath}');
      }
      return null;
    },
    errorPageBuilder: (context, state) {
      return NotFoundScreen.page(key: state.pageKey);
    },
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        name: Pages.splash.name,
        path: '/',
        pageBuilder: (context, state) {
          return SplashPage.page(key: state.pageKey);
        },
      ),

      GoRoute(
        name: Pages.app.name,
        path: '/app',
        redirect: (context, state) {
          if (state.fullPath == '/app') {
            return '/app/home';
          }
          return null;
        },
        routes: [
          GoRoute(
            name: Pages.home.name,
            path: '/home',
            pageBuilder: (context, state) {
              return HomePage.page(key: state.pageKey);
            },
          ),
        ],
      ),
    ],
  );
}
