import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/screens/nav_bar/navigation_bar.dart';
import 'package:match_bet/screens/splash_screen/splash_screen.dart';

import '../screens/account_page/accaount_screen.dart';
import '../screens/add_prognoz_page/list_match_screen.dart';
import '../screens/add_prognoz_page/bets_screen.dart';
import '../screens/add_prognoz_page/publication_screen.dart';
import '../screens/main_page/main_screen.dart';
import '../screens/main_page/match_screen.dart';
import '../screens/main_page/prognoz_match_screen.dart';
import '../screens/start_page/login_screen.dart';
import '../screens/start_page/sign_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(children: [
          AutoRoute(
            page: AccountRoute.page,
            path: 'account',
          ),
          AutoRoute(
            page: MainRoute.page,
            path: 'main',
          ),
          AutoRoute(
            page: ListMatchRoute.page,
            path: 'listPrognoz',
          ),
        ], page: NavigationBarRoute.page, path: '/nav'),
        AutoRoute(
          page: MatchRoute.page,
          path: '/match/:id',
        ),
        AutoRoute(
          page: MyBetRoute.page,
          path: '/bet',
        ),
        AutoRoute(
          page: MyPublicationRoute.page,
          path: '/publication',
        ),
        AutoRoute(
          page: PrognozRoute.page,
          path: '/prognoz',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signUp',
        ),
      ];
}
