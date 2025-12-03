import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Base text field widget configuration
abstract class _BaseAppTextField extends HookWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  final String? prefixText;
  final String? suffixText;

  const _BaseAppTextField({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.borderColor,
    this.focusedBorderColor,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    this.prefixText,
    this.suffixText,
  });

  /// Get the input decoration for this text field
  InputDecoration getDecoration(
    BuildContext context,
    TextEditingController controller,
    ValueNotifier<bool> showPassword,
  ) {
    final theme = Theme.of(context);
    final borderCol = borderColor ?? Colors.grey.shade300;
    final focusedBorderCol = focusedBorderColor ?? theme.primaryColor;
    final bgColor = backgroundColor ?? Colors.grey.shade50;

    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixText: prefixText,
      suffixText: suffixText,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Colors.grey)
          : null,
      suffixIcon: suffixIcon != null || obscureText
          ? IconButton(
              icon: Icon(
                obscureText
                    ? (showPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility)
                    : suffixIcon,
                color: Colors.grey,
              ),
              onPressed: () {
                if (obscureText) {
                  showPassword.value = !showPassword.value;
                } else {
                  onSuffixIconTap?.call();
                }
              },
            )
          : null,
      filled: true,
      fillColor: bgColor,
      contentPadding: padding,
      enabledBorder: getEnabledBorder(borderCol),
      focusedBorder: getFocusedBorder(focusedBorderCol),
      errorBorder: getErrorBorder(),
      focusedErrorBorder: getFocusedErrorBorder(),
      disabledBorder: getDisabledBorder(),
    );
  }

  /// Override to provide custom enabled border
  InputBorder getEnabledBorder(Color borderColor);

  /// Override to provide custom focused border
  InputBorder getFocusedBorder(Color focusedBorderColor);

  /// Override to provide custom error border
  InputBorder getErrorBorder();

  /// Override to provide custom focused error border
  InputBorder getFocusedErrorBorder();

  /// Override to provide custom disabled border
  InputBorder getDisabledBorder();

  /// Build the text field
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialValue);
    final focusNode = useFocusNode();
    final showPassword = useState(false);

    useEffect(() {
      return () {
        // Cleanup is handled by hooks
      };
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          obscureText: obscureText && !showPassword.value,
          maxLines: obscureText && showPassword.value ? 1 : maxLines,
          minLines: minLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
          decoration: getDecoration(context, controller, showPassword),
        ),
      ],
    );
  }
}

/// A customizable outlined text field widget using Flutter Hooks.
class AppOutlinedTextField extends _BaseAppTextField {
  const AppOutlinedTextField({
    super.key,
    super.label,
    super.hint,
    super.initialValue,
    super.onChanged,
    super.onSubmitted,
    super.validator,
    super.obscureText,
    super.prefixIcon,
    super.suffixIcon,
    super.onSuffixIconTap,
    super.maxLines,
    super.minLines,
    super.maxLength,
    super.keyboardType,
    super.enabled,
    super.controller,
    super.focusNode,
    super.borderColor,
    super.focusedBorderColor,
    super.backgroundColor,
    super.borderRadius,
    super.padding,
    super.prefixText,
    super.suffixText,
  });

  @override
  InputBorder getEnabledBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor),
    );
  }

  @override
  InputBorder getFocusedBorder(Color focusedBorderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: focusedBorderColor, width: 2),
    );
  }

  @override
  InputBorder getErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: Colors.red.shade300),
    );
  }

  @override
  InputBorder getFocusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: Colors.red, width: 2),
    );
  }

  @override
  InputBorder getDisabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: Colors.grey.shade200),
    );
  }
}

/// A customizable filled text field widget using Flutter Hooks.
class AppFilledTextField extends _BaseAppTextField {
  const AppFilledTextField({
    super.key,
    super.label,
    super.hint,
    super.initialValue,
    super.onChanged,
    super.onSubmitted,
    super.validator,
    super.obscureText,
    super.prefixIcon,
    super.suffixIcon,
    super.onSuffixIconTap,
    super.maxLines,
    super.minLines,
    super.maxLength,
    super.keyboardType,
    super.enabled,
    super.controller,
    super.focusNode,
    super.borderColor,
    super.focusedBorderColor,
    super.backgroundColor = const Color(0xFFF5F5F5),
    super.borderRadius,
    super.padding,
    super.prefixText,
    super.suffixText,
  });

  @override
  InputBorder getEnabledBorder(Color borderColor) {
    return UnderlineInputBorder(borderSide: BorderSide(color: borderColor));
  }

  @override
  InputBorder getFocusedBorder(Color focusedBorderColor) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: focusedBorderColor, width: 2),
    );
  }

  @override
  InputBorder getErrorBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade300),
    );
  }

  @override
  InputBorder getFocusedErrorBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    );
  }

  @override
  InputBorder getDisabledBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
    );
  }
}

/// A customizable underline text field widget using Flutter Hooks.
class AppUnderlineTextField extends _BaseAppTextField {
  const AppUnderlineTextField({
    super.key,
    super.label,
    super.hint,
    super.initialValue,
    super.onChanged,
    super.onSubmitted,
    super.validator,
    super.obscureText,
    super.prefixIcon,
    super.suffixIcon,
    super.onSuffixIconTap,
    super.maxLines,
    super.minLines,
    super.maxLength,
    super.keyboardType,
    super.enabled,
    super.controller,
    super.focusNode,
    super.borderColor,
    super.focusedBorderColor,
    super.backgroundColor = Colors.transparent,
    super.borderRadius = 0,
    super.padding,
    super.prefixText,
    super.suffixText,
  });

  @override
  InputBorder getEnabledBorder(Color borderColor) {
    return UnderlineInputBorder(borderSide: BorderSide(color: borderColor));
  }

  @override
  InputBorder getFocusedBorder(Color focusedBorderColor) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: focusedBorderColor, width: 2),
    );
  }

  @override
  InputBorder getErrorBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade300),
    );
  }

  @override
  InputBorder getFocusedErrorBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    );
  }

  @override
  InputBorder getDisabledBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200),
    );
  }
}

/// Legacy AppTextField widget - defaults to outlined variant
class AppTextField extends AppOutlinedTextField {
  const AppTextField({
    super.key,
    super.label,
    super.hint,
    super.initialValue,
    super.onChanged,
    super.onSubmitted,
    super.validator,
    super.obscureText,
    super.prefixIcon,
    super.suffixIcon,
    super.onSuffixIconTap,
    super.maxLines,
    super.minLines,
    super.maxLength,
    super.keyboardType,
    super.enabled,
    super.controller,
    super.focusNode,
    super.borderColor,
    super.focusedBorderColor,
    super.backgroundColor,
    super.borderRadius,
    super.padding,
    super.prefixText,
    super.suffixText,
  });
}
