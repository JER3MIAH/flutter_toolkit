import 'package:flutter/foundation.dart';

/// Logging utility for debugging and monitoring.
class AppLogger {
  static const String _prefix = '[AppLogger]';
  static bool _isDebugMode = kDebugMode;

  /// Enable or disable logging
  static void setDebugMode(bool enabled) {
    _isDebugMode = enabled;
  }

  /// Log an info message
  static void info(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix INFO $prefix: $message');
  }

  /// Log a debug message
  static void debug(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix DEBUG $prefix: $message');
  }

  /// Log a warning message
  static void warning(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ⚠️ WARNING $prefix: $message');
  }

  /// Log an error message
  static void error(
    String message, {
    String tag = '',
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ❌ ERROR $prefix: $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace:\n$stackTrace');
    }
  }

  /// Log a success message
  static void success(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ✅ SUCCESS $prefix: $message');
  }

  /// Log an object as JSON
  static void json(dynamic object, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix JSON $prefix: $object');
  }

  /// Log a separator line for readability
  static void separator({String char = '-', int length = 50}) {
    if (!_isDebugMode) return;
    debugPrint('$_prefix ${char * length}');
  }

  /// Log method entry
  static void enter(String methodName, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ➡️ ENTER $prefix: $methodName');
  }

  /// Log method exit
  static void exit(String methodName, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ⬅️ EXIT $prefix: $methodName');
  }
}
