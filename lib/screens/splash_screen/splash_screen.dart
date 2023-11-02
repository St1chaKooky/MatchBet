import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/auth_bloc/auth_bloc.dart';
import 'package:match_bet/router/router.dart';

import 'package:match_bet/utils/colors.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          AutoRouter.of(context).push(NavigationBarRoute());
        } else if (((state.status == AuthStatus.unauthenticated) ||
            (state.status == AuthStatus.unknown))) {
          AutoRouter.of(context).push(const LoginRoute());
        }
        return Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: primaryColor,
            ),
          ),
        );
      },
    ));
  }
}
