import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static const _reset = '\x1B[0m';

  static const _red = '\x1B[31m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _blue = '\x1B[34m';

  static void log(String message) {
    if (kDebugMode) {
      print("$_blue📝 LOG: $message$_reset");
    }
  }

  static void success(String message) {
    if (kDebugMode) {
      print("$_green✅ SUCCESS: $message$_reset");
    }
  }

  static void warning(String message) {
    if (kDebugMode) {
      print("$_yellow⚠️ WARNING: $message$_reset");
    }
  }

  static void error(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      print("$_red❌ ERROR: $message$_reset");

      if (error != null) {
        print("$_red$error$_reset");
      }

      if (stackTrace != null) {
        print("$_red$stackTrace$_reset");
      }
    }
  }
}
