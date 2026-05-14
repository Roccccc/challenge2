import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/luxury_dark_theme.dart';

/// Reusable frosted glass panel (BackdropFilter + tint).
class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.blurSigma = 22,
    this.tint,
    this.border,
    this.padding,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final double blurSigma;
  final Color? tint;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveTint =
        tint ?? LuxuryDarkTheme.charcoalCard.withValues(alpha: 0.52);

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: effectiveTint,
            borderRadius: borderRadius,
            border: border ??
                Border.all(color: LuxuryDarkTheme.gold.withValues(alpha: 0.18)),
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
