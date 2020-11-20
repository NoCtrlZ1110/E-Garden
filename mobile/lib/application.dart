
// ignore: constant_identifier_names
import 'package:e_garden/utils/api.dart';
import 'package:e_garden/utils/shared_preferences.dart';

enum ENV { PRODUCTION, DEV }

class Application {
  static ENV env = ENV.DEV;
  static SpUtil sharePreference;
  static API api;

  Map<String, String> get config {
    if (Application.env == ENV.PRODUCTION) {
      return {};
    }
    if (Application.env == ENV.DEV) {
      return {};
    }
    return {};
  }
}
