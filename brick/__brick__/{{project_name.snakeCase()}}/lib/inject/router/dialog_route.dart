import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DialogModalRoute extends CustomRoute {
  DialogModalRoute({required super.page, super.path})
      : super(
          customRouteBuilder: dialogRouteBuilder,
        );

  // must be static and public
  static Route<T> dialogRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    // DialogRoute is coming from flutter material
    return DialogRoute<T>(
      context: context,
      settings: page, // must assign page to settings
      builder: (context) => child,
    );
  }
}
