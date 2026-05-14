import 'package:flutter/material.dart';

import '../theme/luxury_dark_theme.dart';

/// Network luxury imagery with graceful offline / error fallback (tests stay stable).
class LuxuryNetworkImage extends StatelessWidget {
  const LuxuryNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String url;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      url,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      gaplessPlayback: true,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(
          child: SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stack) => DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              LuxuryDarkTheme.charcoalCard,
              LuxuryDarkTheme.charcoalElevated,
            ],
          ),
        ),
        child: const Center(
          child: Icon(Icons.image_not_supported_outlined, color: LuxuryDarkTheme.goldMuted),
        ),
      ),
    );

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }
}
