import 'package:flutter/material.dart';

/// Brand colours that do not change between light and dark.
abstract final class Brand {
  static const violet = Color(0xFF6D5BFF);
  static const mint = Color(0xFF2DD4A8);
  static const amber = Color(0xFFFFB547);
  static const coral = Color(0xFFFF6B6B);
}

/// Extra semantic colours that Material's ColorScheme has no slot for.
/// Read them with `Theme.of(context).extension<VyoraColors>()!`.
@immutable
class VyoraColors extends ThemeExtension<VyoraColors> {
  const VyoraColors({
    required this.surface2,
    required this.muted,
    required this.border,
    required this.accentText,
    required this.success,
    required this.xp,
    required this.danger,
  });

  final Color surface2;
  final Color muted;
  final Color border;
  final Color accentText;
  final Color success;
  final Color xp;
  final Color danger;

  static const dark = VyoraColors(
    surface2: Color(0xFF20223A),
    muted: Color(0xFFA3A6BF),
    border: Color(0xFF2A2C47),
    accentText: Color(0xFFA99DFF),
    success: Color(0xFF3EE0B5),
    xp: Color(0xFFFFC35E),
    danger: Color(0xFFFF8A8A),
  );

  static const light = VyoraColors(
    surface2: Color(0xFFEEEFFA),
    muted: Color(0xFF5B5E7A),
    border: Color(0xFFE1E2F0),
    accentText: Color(0xFF5B47E8),
    success: Color(0xFF0B8F6B),
    xp: Color(0xFF9A5B00),
    danger: Color(0xFFC0392B),
  );

  @override
  VyoraColors copyWith({
    Color? surface2,
    Color? muted,
    Color? border,
    Color? accentText,
    Color? success,
    Color? xp,
    Color? danger,
  }) {
    return VyoraColors(
      surface2: surface2 ?? this.surface2,
      muted: muted ?? this.muted,
      border: border ?? this.border,
      accentText: accentText ?? this.accentText,
      success: success ?? this.success,
      xp: xp ?? this.xp,
      danger: danger ?? this.danger,
    );
  }

  @override
  VyoraColors lerp(ThemeExtension<VyoraColors>? other, double t) {
    if (other is! VyoraColors) return this;
    return VyoraColors(
      surface2: Color.lerp(surface2, other.surface2, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      border: Color.lerp(border, other.border, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      success: Color.lerp(success, other.success, t)!,
      xp: Color.lerp(xp, other.xp, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
    );
  }
}
