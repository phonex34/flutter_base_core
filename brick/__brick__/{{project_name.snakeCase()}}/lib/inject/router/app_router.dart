import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/base/common_widget.dart/common_dialog.dart';
import 'package:{{project_name.snakeCase()}}/inject/get_it.dart';
import 'package:{{project_name.snakeCase()}}/inject/router/dialog_route.dart';
import 'package:{{project_name.snakeCase()}}/modules/counter/counter.dart';
import 'package:{{project_name.snakeCase()}}/modules/home_page/home_page.dart';
import 'package:{{project_name.snakeCase()}}/modules/github/github.dart';
part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      children: [
        AutoRoute(page: CounterRoute.page),
        AutoRoute(page: SettingRoute.page),
        AutoRoute(page: GithubRoute.page),
      ],
    ),
    DialogModalRoute(page: CommonDialogRoute.page),
  ];

  static AppRouter get instance => getIt<AppRouter>();
}
