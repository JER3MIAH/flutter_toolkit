import 'package:flutter/foundation.dart';

/// Logging utility for debugging and monitoring application behavior.
///
/// `KitLogger` provides a centralized logging system with support for different
/// log levels (info, debug, warning, error, success) and context tagging.
/// Logging is only active in debug mode and can be toggled programmatically.
///
/// Example:
/// ```dart
/// KitLogger.info('App started');
/// KitLogger.debug('User data: $user', tag: 'UserService');
/// KitLogger.error('Failed to load', error: exception, stackTrace: stackTrace);
/// KitLogger.success('Operation completed');
/// ```
class KitLogger {
  KitLogger._(); // Private constructor to prevent instantiation

  static const String _prefix = '[KitLogger]';
  static bool _isDebugMode = kDebugMode;

  /// Enable or disable all logging output.
  ///
  /// Use this to toggle logging at runtime based on environment or settings.
  /// Example: `KitLogger.setDebugMode(false)` to disable logs in production.
  static void setDebugMode(bool enabled) {
    _isDebugMode = enabled;
  }

  /// Log an informational message.
  ///
  /// Parameters:
  ///   - [message]: The message to log
  ///   - [tag]: Optional context tag to identify the caller (e.g., 'UserService')
  static void info(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix INFO $prefix: $message');
  }

  /// Log a debug message for detailed diagnostic information.
  ///
  /// Parameters:
  ///   - [message]: The message to log
  ///   - [tag]: Optional context tag to identify the caller
  static void debug(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix DEBUG $prefix: $message');
  }

  /// Log a warning message for potentially problematic situations.
  ///
  /// Parameters:
  ///   - [message]: The message to log
  ///   - [tag]: Optional context tag to identify the caller
  static void warning(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ⚠️ WARNING $prefix: $message');
  }

  /// Log an error message with optional exception and stack trace.
  ///
  /// Parameters:
  ///   - [message]: The error message to log
  ///   - [tag]: Optional context tag to identify the caller
  ///   - [error]: Optional exception object
  ///   - [stackTrace]: Optional stack trace for debugging
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

  /// Log a success message indicating a successful operation.
  ///
  /// Parameters:
  ///   - [message]: The success message to log
  ///   - [tag]: Optional context tag to identify the caller
  static void success(String message, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ✅ SUCCESS $prefix: $message');
  }

  /// Log an object or data structure (typically for JSON output).
  ///
  /// Parameters:
  ///   - [object]: The object to log
  ///   - [tag]: Optional context tag to identify the caller
  static void json(dynamic object, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix JSON $prefix: $object');
  }

  /// Log a visual separator line for improved readability in logs.
  ///
  /// Parameters:
  ///   - [char]: The character to use for the separator (default: '-')
  ///   - [length]: The length of the separator line (default: 50)
  static void separator({String char = '-', int length = 50}) {
    if (!_isDebugMode) return;
    debugPrint('$_prefix ${char * length}');
  }

  /// Log method entry for tracking function execution flow.
  ///
  /// Parameters:
  ///   - [methodName]: The name of the method being entered
  ///   - [tag]: Optional context tag to identify the caller
  static void enter(String methodName, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ➡️ ENTER $prefix: $methodName');
  }

  /// Log method exit for tracking function execution flow.
  ///
  /// Parameters:
  ///   - [methodName]: The name of the method being exited
  ///   - [tag]: Optional context tag to identify the caller
  static void exit(String methodName, {String tag = ''}) {
    if (!_isDebugMode) return;
    final prefix = tag.isNotEmpty ? '[$tag]' : '';
    debugPrint('$_prefix ⬅️ EXIT $prefix: $methodName');
  }
}
