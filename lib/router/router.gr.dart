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
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MatchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MatchScreen(),
      );
    },
    MatchRouteAdd.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MatchScreenAdd(),
      );
    },
    MyBetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBetScreen(),
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationBarScreen(),
      );
    },
    PrognozRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrognozScreen(),
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
class MatchRoute extends PageRouteInfo<void> {
  const MatchRoute({List<PageRouteInfo>? children})
      : super(
          MatchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MatchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MatchScreenAdd]
class MatchRouteAdd extends PageRouteInfo<void> {
  const MatchRouteAdd({List<PageRouteInfo>? children})
      : super(
          MatchRouteAdd.name,
          initialChildren: children,
        );

  static const String name = 'MatchRouteAdd';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyBetScreen]
class MyBetRoute extends PageRouteInfo<void> {
  const MyBetRoute({List<PageRouteInfo>? children})
      : super(
          MyBetRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
class NavigationBarRoute extends PageRouteInfo<void> {
  const NavigationBarRoute({List<PageRouteInfo>? children})
      : super(
          NavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
