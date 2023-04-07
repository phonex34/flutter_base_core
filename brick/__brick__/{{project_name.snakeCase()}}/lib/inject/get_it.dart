// ignore_for_file: avoid_redundant_argument_values

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:{{project_name.snakeCase()}}/inject/get_it.config.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {
  init(getIt);
  await getIt.allReady();
}
