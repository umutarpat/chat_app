import 'package:flutter/material.dart';

@immutable
class DesignColors extends ThemeExtension<DesignColors> {
  const DesignColors({required this.cardColor});

  final Color? cardColor;

  @override
  DesignColors copyWith({Color? cardColor}) {
    return DesignColors(cardColor: cardColor ?? this.cardColor);
  }

  @override
  DesignColors lerp(DesignColors other, double t) {
    return DesignColors(cardColor: Color.lerp(cardColor, other.cardColor, t));
  }
}
