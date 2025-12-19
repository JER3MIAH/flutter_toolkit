/// Comprehensive validation utilities for common input validation patterns.
///
/// This class provides static methods for validating various types of user input
/// such as email, password, phone numbers, URLs, and more. All validators return
/// `null` if validation passes, or an error message if validation fails.
///
/// All methods support an [isOptional] parameter to allow empty/null values.
///
/// Example:
/// ```dart
/// final error = Validators.validateEmail(userInput);
/// if (error != null) {
///   print('Error: $error');
/// }
/// ```
class Validators {
  Validators._(); // Private constructor to prevent instantiation

  /// Validates an email address format.
  ///
  /// Parameters:
  ///   - [value]: The email string to validate
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateEmail(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validates a password with strength requirements.
  ///
  /// Checks for:
  /// - Minimum length (default: 8 characters)
  /// - At least one uppercase letter
  /// - At least one lowercase letter
  /// - At least one number
  ///
  /// Parameters:
  ///   - [value]: The password string to validate
  ///   - [length]: Minimum password length required (default: 8)
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validatePassword(
    String? value, {
    int length = 8,
    bool isOptional = false,
  }) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < length) {
      return 'Password must be at least $length characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain a lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain a number';
    }
    return null;
  }

  /// Validates that a field is not empty.
  ///
  /// Parameters:
  ///   - [value]: The field value to validate
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateRequired(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  /// Validates a phone number format.
  ///
  /// Supports common phone number formats including:
  /// - +1234567890
  /// - (123) 456-7890
  /// - 123-456-7890
  /// - 123.456.7890
  /// - 1234567890
  ///
  /// Parameters:
  ///   - [value]: The phone number string to validate
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validatePhoneNumber(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(
      r'^[+]?[(]?[0-9]{3}[)]?[-\s.]?[0-9]{3}[-\s.]?[0-9]{4,6}$',
    );
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  /// Validates a URL format.
  ///
  /// Ensures the URL:
  /// - Is a valid URI format
  /// - Starts with http:// or https://
  ///
  /// Parameters:
  ///   - [value]: The URL string to validate
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateUrl(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'URL is required';
    try {
      Uri.parse(value);
      if (!value.startsWith('http://') && !value.startsWith('https://')) {
        return 'URL must start with http:// or https://';
      }
      return null;
    } catch (e) {
      return 'Please enter a valid URL';
    }
  }

  /// Validates a username format.
  ///
  /// Ensures the username:
  /// - Is at least 3 characters long
  /// - Contains only letters, numbers, and underscores
  ///
  /// Parameters:
  ///   - [value]: The username string to validate
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateUsername(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Username is required';
    if (value.length < 3) return 'Username must be at least 3 characters';
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  /// Validates that two field values match.
  ///
  /// Useful for password confirmation or matching fields.
  ///
  /// Parameters:
  ///   - [value]: The first value to compare
  ///   - [matchValue]: The second value to compare
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if values match, error message if they don't
  static String? validateMatch(
    String? value,
    String? matchValue, {
    bool isOptional = false,
  }) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'This field is required';
    if (value != matchValue) return 'Fields do not match';
    return null;
  }

  /// Validates minimum string length.
  ///
  /// Parameters:
  ///   - [value]: The string to validate
  ///   - [minLength]: The minimum required length
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateMinLength(
    String? value,
    int minLength, {
    bool isOptional = false,
  }) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'This field is required';
    if (value.length < minLength) {
      return 'Must be at least $minLength characters';
    }
    return null;
  }

  /// Validates maximum string length.
  ///
  /// Parameters:
  ///   - [value]: The string to validate
  ///   - [maxLength]: The maximum allowed length
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateMaxLength(
    String? value,
    int maxLength, {
    bool isOptional = false,
  }) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'This field is required';
    if (value.length > maxLength) {
      return 'Must not exceed $maxLength characters';
    }
    return null;
  }

  /// Validates that a string is a valid number.
  ///
  /// Parameters:
  ///   - [value]: The string to validate as a number
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateNumber(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Number is required';
    if (double.tryParse(value) == null) return 'Please enter a valid number';
    return null;
  }

  /// Validates that the total of multiple numeric fields doesn't exceed a maximum.
  ///
  /// Useful for distributing totals across multiple fields (e.g., percentages, scores).
  ///
  /// Parameters:
  ///   - [values]: List of numeric string values to sum and validate
  ///   - [isOptional]: If true, all empty/null values are allowed together
  ///   - [maxTotal]: The maximum allowed total (default: 100)
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateNumericFieldsTotal(
    List<String?> values, {
    bool isOptional = false,
    double maxTotal = 100,
  }) {
    // If optional and all empty → allow it
    if (isOptional && values.every((v) => v == null || v.isEmpty)) {
      return null;
    }

    double total = 0;

    for (final value in values) {
      if (value == null || value.isEmpty) {
        return 'All fields are required';
      }

      final parsed = double.tryParse(value);
      if (parsed == null) {
        return 'Please enter valid numbers';
      }

      total += parsed;
    }

    if (total > maxTotal) {
      return 'Total score cannot exceed $maxTotal';
    }

    return null;
  }

  /// Validates that a field contains non-empty text (trimmed).
  ///
  /// Differs from [validateRequired] by checking trimmed strings,
  /// which rejects strings containing only whitespace.
  ///
  /// Parameters:
  ///   - [value]: The string to validate
  ///   - [isOptional]: If true, null or empty values are allowed
  ///
  /// Returns: null if valid, error message if invalid
  static String? validateRequiredText(
    String? value, {
    bool isOptional = false,
  }) {
    if ((value == null || value.trim().isEmpty) && isOptional) return null;
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }
}
