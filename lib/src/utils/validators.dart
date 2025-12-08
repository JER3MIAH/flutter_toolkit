/// Validation utilities for common input validation patterns.
class Validators {
  Validators._();

  /// Validates an email address
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

  /// Validates a password
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

  /// Validates that a field is not empty
  static String? validateRequired(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  /// Validates a phone number
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

  /// Validates a URL
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

  /// Validates a username
  static String? validateUsername(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Username is required';
    if (value.length < 3) return 'Username must be at least 3 characters';
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null;
  }

  /// Validates that two fields match
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

  /// Validates minimum length
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

  /// Validates maximum length
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

  /// Check if a string is a valid number
  static String? validateNumber(String? value, {bool isOptional = false}) {
    if ((value == null || value.isEmpty) && isOptional) return null;
    if (value == null || value.isEmpty) return 'Number is required';
    if (double.tryParse(value) == null) return 'Please enter a valid number';
    return null;
  }

  /// Validates that a field contains non-empty text (not just spaces)
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
