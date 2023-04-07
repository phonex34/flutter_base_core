import 'package:flutter/foundation.dart';

enum BuildMode {
  release,
  profile,
  debug,
}

abstract class BuildModeFactory {
  BuildModeFactory._internal();

  static BuildMode create() {
    if (kReleaseMode) {
      return BuildMode.release;
    }

    if (kProfileMode) {
      return BuildMode.profile;
    }

    if (kDebugMode) {
      return BuildMode.debug;
    }

    throw StateError('Unknown app build mode');
  }
}

enum Flavor {
  prod,
  stag,
  dev,
}

class BuildConfig {
  static String get asPrettyString =>
      ' - flavor: $flavorName\n - buildMode: $buildMode\n';
  static late Flavor flavor;
  static BuildMode buildMode = BuildModeFactory.create();

  static String get flavorName {
    switch (flavor) {
      case Flavor.prod:
        return 'product';
      case Flavor.dev:
        return 'dev';
      case Flavor.stag:
        return 'stag';
    }
  }

  static String get baseURL {
    switch (flavor) {
      case Flavor.dev:
        return 'https://dev.api.com/api/v1/';
      case Flavor.stag:
        return 'https://stag.api.com/api/v1/';
      case Flavor.prod:
        return 'https://live.api.com/api/v1/';
    }
  }
}
