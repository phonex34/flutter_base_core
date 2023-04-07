import 'package:{{project_name.snakeCase()}}/modules/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/build_config.dart';

void main() {
  BuildConfig.flavor = Flavor.stag;
  bootstrap(() => const App());
}
