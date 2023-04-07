import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/inject/get_it.dart';

@lazySingleton
class SnackbarManager {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBar(SnackBar snackBar) {
    scaffoldKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void handleInfo(String message) {
    scaffoldKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  static SnackbarManager get instance => getIt<SnackbarManager>();
}
