import 'package:flutter/material.dart';

@immutable
class DesignTextStyles extends ThemeExtension<DesignTextStyles> {
  const DesignTextStyles({
    required this.fieldHintTextStyle,
    required this.fieldErrorTextStyle,
  });

  final TextStyle fieldHintTextStyle;
  final TextStyle fieldErrorTextStyle;

  @override
  DesignTextStyles copyWith({
    TextStyle? fieldHintTextStyle,
    TextStyle? fieldErrorTextStyle,
  }) {
    return DesignTextStyles(
      fieldHintTextStyle: fieldHintTextStyle ?? this.fieldHintTextStyle,
      fieldErrorTextStyle: fieldErrorTextStyle ?? this.fieldErrorTextStyle,
    );
  }

  @override
  DesignTextStyles lerp(DesignTextStyles other, double t) {
    return DesignTextStyles(
      fieldHintTextStyle: TextStyle.lerp(
        fieldHintTextStyle,
        other.fieldHintTextStyle,
        t,
      )!,
      fieldErrorTextStyle: TextStyle.lerp(
        fieldErrorTextStyle,
        other.fieldErrorTextStyle,
        t,
      )!,
    );
  }
}
