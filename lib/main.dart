import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/auth_bloc/auth_bloc.dart';

import 'package:match_bet/firebase_options.dart';
import 'package:match_bet/repositories/auth/firebase_user_repositories.dart';
import 'package:match_bet/router/router.dart';

import 'package:match_bet/utils/theme.dart';

import 'simpe_bloc_observer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthBloc>(
          create: (_) => AuthBloc(myUserRepo: FirebseUserRepository()),
        ),
        // Другие провайдеры
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      routerConfig: _router.config(),
    );
  }
}
