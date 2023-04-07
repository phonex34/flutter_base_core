import 'package:{{project_name.snakeCase()}}/modules/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/build_config.dart';

void main() {
  BuildConfig.flavor = Flavor.dev;
  bootstrap(() => const App());
}
