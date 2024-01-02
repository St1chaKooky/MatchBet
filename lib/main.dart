import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/auth_bloc/auth_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/my_user_bloc/my_user_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/sign_in_bloc/sign_in_bloc.dart';
import 'package:match_bet/bloc/bloc_auth/sign_up_bloc/sign_up_bloc.dart';
import 'package:match_bet/bloc/bloc_post/create_post_bloc/create_post_bloc_bloc.dart';
import 'package:match_bet/bloc/bloc_post/get_post_bloc/get_post_bloc_bloc.dart';
import 'package:match_bet/bloc/update_user_info/update_user_info_bloc.dart';

import 'package:match_bet/firebase_options.dart';
import 'package:match_bet/repositories/auth_repositories/firebase_user_repositories.dart';
import 'package:match_bet/repositories/post_repositories/firebase_post_repositories.dart';
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
        BlocProvider(
          create: (context) =>
              SignInBloc(userRepository: context.read<AuthBloc>().userRepo),
        ),
        BlocProvider(
          create: (context) =>
              SignUpBloc(userRepository: context.read<AuthBloc>().userRepo),
        ),
        BlocProvider(
          create: (context) => UpdateUserInfoBloc(
              userRepository: context.read<AuthBloc>().userRepo),
        ),
        BlocProvider(
          create: (context) => MyUserBloc(
              myUserRepository: context.read<AuthBloc>().userRepo)
            ..add(
                GetMyUser(myUserId: context.read<AuthBloc>().state.user!.uid)),
        ),
        BlocProvider<CreatePostBlocBloc>(
          create: (context) =>
              CreatePostBlocBloc(postRepository: FirebasePostRepository()),
        ),
        BlocProvider<GetPostBlocBloc>(
          create: (context) =>
              GetPostBlocBloc(postRepository: FirebasePostRepository())
                ..add(GetPosts()),
        ),
      ],
      child: const MyApp(),
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
