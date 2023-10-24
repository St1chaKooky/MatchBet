// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    ListMatchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListMatchScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MatchRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MatchRouteArgs>(
          orElse: () => MatchRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MatchScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MyBetRoute.name: (routeData) {
      final args = routeData.argsAs<MyBetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyBetScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MyPublicationRoute.name: (routeData) {
      final args = routeData.argsAs<MyPublicationRouteArgs>(
          orElse: () => const MyPublicationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyPublicationScreen(key: args.key),
      );
    },
    NavigationBarRoute.name: (routeData) {
      final args = routeData.argsAs<NavigationBarRouteArgs>(
          orElse: () => const NavigationBarRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NavigationBarScreen(key: args.key),
      );
    },
    PrognozRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrognozScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListMatchScreen]
class ListMatchRoute extends PageRouteInfo<void> {
  const ListMatchRoute({List<PageRouteInfo>? children})
      : super(
          ListMatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListMatchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MatchScreen]
class MatchRoute extends PageRouteInfo<MatchRouteArgs> {
  MatchRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          MatchRoute.name,
          args: MatchRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'MatchRoute';

  static const PageInfo<MatchRouteArgs> page = PageInfo<MatchRouteArgs>(name);
}

class MatchRouteArgs {
  const MatchRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'MatchRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [MyBetScreen]
class MyBetRoute extends PageRouteInfo<MyBetRouteArgs> {
  MyBetRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          MyBetRoute.name,
          args: MyBetRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'MyBetRoute';

  static const PageInfo<MyBetRouteArgs> page = PageInfo<MyBetRouteArgs>(name);
}

class MyBetRouteArgs {
  const MyBetRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'MyBetRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [MyPublicationScreen]
class MyPublicationRoute extends PageRouteInfo<MyPublicationRouteArgs> {
  MyPublicationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MyPublicationRoute.name,
          args: MyPublicationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MyPublicationRoute';

  static const PageInfo<MyPublicationRouteArgs> page =
      PageInfo<MyPublicationRouteArgs>(name);
}

class MyPublicationRouteArgs {
  const MyPublicationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MyPublicationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NavigationBarScreen]
class NavigationBarRoute extends PageRouteInfo<NavigationBarRouteArgs> {
  NavigationBarRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NavigationBarRoute.name,
          args: NavigationBarRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NavigationBarRoute';

  static const PageInfo<NavigationBarRouteArgs> page =
      PageInfo<NavigationBarRouteArgs>(name);
}

class NavigationBarRouteArgs {
  const NavigationBarRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NavigationBarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PrognozScreen]
class PrognozRoute extends PageRouteInfo<void> {
  const PrognozRoute({List<PageRouteInfo>? children})
      : super(
          PrognozRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrognozRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
