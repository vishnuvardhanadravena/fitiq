import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AppToast {
  AppToast._();
  static void _show(String message, Color bgColor) {
    // Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 14,
    );
  }
  static void success(String message) {
    _show(" $message", Colors.green);
  }
  static void error(String message) {
    _show(" $message", Colors.red);
  }
  static void warning(String message) {
    _show(" $message", Colors.orange);
  }
  static void info(String message) {
    _show("ℹ $message", Colors.blue);
  }
}
