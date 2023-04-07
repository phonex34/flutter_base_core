// ignore_for_file: avoid_redundant_argument_values

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:{{project_name.snakeCase()}}/inject/get_it.dart';

@lazySingleton
class LoggerManager extends Logger {
  LoggerManager()
      : super(
          printer: PrettyPrinter(
            methodCount: 2,
            errorMethodCount: 16,
            lineLength: 120,
            colors: true,
            printEmojis: true,
          ),
        );

  static LoggerManager get instance => getIt<LoggerManager>();
}
