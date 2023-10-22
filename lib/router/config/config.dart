import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:match_bet/bloc/auth/auth_bloc.dart';
import 'package:match_bet/router/nav_bar/navigation_bar.dart';
import 'package:match_bet/router/router.dart';
import 'package:match_bet/screens/start_page/login_screen.dart';

List<Page> myRoutests(AppStatus state, List<Page> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [LoginScreen.page()];

    case AppStatus.unauthenticated:
      return [NavigationBarScreen.page()];
  }
}
