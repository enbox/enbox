import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

/// Route names for Enbox routes.
abstract class RouteNames {
  static const String today = "/today";
}

/// Page titles for Enbox pages.
abstract class PageTitles {
  static const String today = "Today";
}

/// Returns whether the given [BuildContext] is on a mobile platform.
bool isMobile(BuildContext context) {
  return !kIsWeb &&
      [
        TargetPlatform.android,
        TargetPlatform.iOS,
      ].contains(Theme.of(context).platform);
}
