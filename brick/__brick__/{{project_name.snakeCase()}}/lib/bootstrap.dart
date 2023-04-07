import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
{{#isBloc}}
import 'package:bloc/bloc.dart';
import 'package:{{project_name.snakeCase()}}/build_config.dart';
import 'package:{{project_name.snakeCase()}}/inject/get_it.dart';
import 'package:{{project_name.snakeCase()}}/inject/logger_manager.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();
  final logger = LoggerManager.instance;
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
{{/isBloc}}
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await configureDependencies();
  final logger = LoggerManager.instance..i(BuildConfig.asPrettyString);
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  {{#isBloc}}
  Bloc.observer = AppBlocObserver();
  {{/isBloc}}
  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
