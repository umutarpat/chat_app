import 'package:flutter/material.dart';

@immutable
class DesignColors extends ThemeExtension<DesignColors> {
  const DesignColors({
    required this.cardColor,
    required this.cardSuccessColor,
    required this.cardErrorColor,
  });

  final Color? cardColor;
  final Color? cardSuccessColor;
  final Color? cardErrorColor;

  @override
  DesignColors copyWith({
    Color? cardColor,
    Color? cardSuccessColor,
    Color? cardErrorColor,
  }) {
    return DesignColors(
      cardColor: cardColor ?? this.cardColor,
      cardSuccessColor: cardSuccessColor ?? this.cardSuccessColor,
      cardErrorColor: cardErrorColor ?? this.cardErrorColor,
    );
  }

  @override
  DesignColors lerp(DesignColors other, double t) {
    return DesignColors(
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      cardSuccessColor: Color.lerp(cardSuccessColor, other.cardSuccessColor, t),
      cardErrorColor: Color.lerp(cardErrorColor, other.cardErrorColor, t),
    );
  }
}
