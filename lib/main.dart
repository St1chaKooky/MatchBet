// import 'package:flutter/material.dart';
// import 'package:match_bet/router/router.dart';
//
// import 'package:match_bet/utils/theme.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final _router = AppRouter();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       theme: buildThemeData(context),
//       routerConfig: _router.config(),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_bet/bloc/auth/auth_bloc.dart';
import 'package:match_bet/firebase_options.dart';

import 'package:match_bet/repositories/auth/domain/auth_repositories.dart';
import 'package:match_bet/router/config/config.dart';

import 'package:match_bet/utils/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final auth = AuthRepositories();
  runApp(App(
    authRepositories: auth,
  ));
}

class App extends StatelessWidget {
  final AuthRepositories _authRepositories;
  const App({Key? key, required AuthRepositories authRepositories})
      : _authRepositories = authRepositories,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepositories,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepositories),
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(context),
      home: FlowBuilder(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: myRoutests,
      ),
    );
  }
}
