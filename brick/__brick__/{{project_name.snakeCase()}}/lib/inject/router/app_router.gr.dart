// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingPage(),
      );
    },
    GithubRoute.name: (routeData) {
      final args = routeData.argsAs<GithubRouteArgs>(
          orElse: () => const GithubRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GithubPage(key: args.key),
      );
    },
    CounterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CounterPage(),
      );
    },
    CommonDialogRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CommonDialogPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GithubPage]
class GithubRoute extends PageRouteInfo<GithubRouteArgs> {
  GithubRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GithubRoute.name,
          args: GithubRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GithubRoute';

  static const PageInfo<GithubRouteArgs> page = PageInfo<GithubRouteArgs>(name);
}

class GithubRouteArgs {
  const GithubRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'GithubRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CounterPage]
class CounterRoute extends PageRouteInfo<void> {
  const CounterRoute({List<PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CommonDialogPage]
class CommonDialogRoute extends PageRouteInfo<void> {
  const CommonDialogRoute({List<PageRouteInfo>? children})
      : super(
          CommonDialogRoute.name,
          initialChildren: children,
        );

  static const String name = 'CommonDialogRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
