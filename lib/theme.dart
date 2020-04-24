import "package:flutter/material.dart";

/// The Enbox theme.
abstract class EnboxTheme {
  /// Light variant of the theme.
  static final ThemeData light = ThemeData(
    fontFamily: "Yantramanav",
    textTheme: const TextTheme(
      bodyText1: const TextStyle(
        // #000000
        color: Colors.black,
      ),
      caption: const TextStyle(
        // #8F8F8F
        color: const Color.fromARGB(255, 143, 143, 143),
      ),
    ),
  );

  /// The default theme. Defaults to the light theme.
  static final ThemeData fallback = light;
  // TODO: dark theme
}
