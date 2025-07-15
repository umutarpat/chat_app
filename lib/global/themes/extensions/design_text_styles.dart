import 'package:flutter/material.dart';

@immutable
class DesignTextStyles extends ThemeExtension<DesignTextStyles> {
  const DesignTextStyles({
    required this.fieldHintTextStyle,
    required this.fieldErrorTextStyle,
    required this.buttonTextStyle,
    required this.secondaryButtonTextStyle,
  });

  final TextStyle fieldHintTextStyle;
  final TextStyle fieldErrorTextStyle;
  final TextStyle buttonTextStyle;
  final TextStyle secondaryButtonTextStyle;
  @override
  DesignTextStyles copyWith({
    TextStyle? fieldHintTextStyle,
    TextStyle? fieldErrorTextStyle,
    TextStyle? buttonTextStyle,
    TextStyle? secondaryButtonTextStyle,
  }) {
    return DesignTextStyles(
      fieldHintTextStyle: fieldHintTextStyle ?? this.fieldHintTextStyle,
      fieldErrorTextStyle: fieldErrorTextStyle ?? this.fieldErrorTextStyle,
      buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
      secondaryButtonTextStyle:
          secondaryButtonTextStyle ?? this.secondaryButtonTextStyle,
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
      buttonTextStyle: TextStyle.lerp(
        buttonTextStyle,
        other.buttonTextStyle,
        t,
      )!,
      secondaryButtonTextStyle: TextStyle.lerp(
        secondaryButtonTextStyle,
        other.secondaryButtonTextStyle,
        t,
      )!,
    );
  }
}
