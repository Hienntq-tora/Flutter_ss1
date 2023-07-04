import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:time_tracker/core/environment_variables_keys.dart';

enum Environment { debug, release }

extension EnvironmentX on Environment {
  static const String dir = "lib/envs";

  String get toPath {
    switch (this) {
      case Environment.debug:
        return "$dir/debug.env";
      case Environment.release:
        return "$dir/release.env";
    }
  }

  Future<String?> parseStringToMapValue(String key) async {
    final lines = await rootBundle.loadString(toPath);
    Map<String, String> environment = {};
    for (String line in lines.split('\n')) {
      line = line.trim();
      if (line.contains('=') //Set Key Value Pairs on lines separated by =
          &&
          !line.startsWith(RegExp(r'=|#'))) {
        //No need to add emty keys and remove comments
        List<String> contents = line.split('=');
        environment[contents[0]] = contents.sublist(1).join('=');
      }
    }
    return environment[key];
  }
}

class EnvironmentManager {
  Environment get env {
    return kDebugMode ? Environment.debug : Environment.release;
  }

  Future<String?> getValue(String key) async =>
      await env.parseStringToMapValue(key);

  Future<String> get cloudName async =>
      await getValue(EnvironmentVariablesKeys.cloudName) ?? '';

  Future<String> get uploadPreset async =>
      await getValue(EnvironmentVariablesKeys.uploadPreset) ?? '';

  Future<String> get shipBookAppId async =>
      await getValue(EnvironmentVariablesKeys.shipBookAppId) ?? '';

  Future<String> get shipBookToken async =>
      await getValue(EnvironmentVariablesKeys.shipBookToken) ?? '';
}
