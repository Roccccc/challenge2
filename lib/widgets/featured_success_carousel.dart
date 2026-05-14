import 'package:flutter/material.dart';

import '../models/agent_models.dart';
import '../theme/luxury_dark_theme.dart';
import 'glass_surface.dart';
import 'luxury_network_image.dart';

/// Horizontally scrolling gallery of signature wins (personal brand, not raw MLS dumps).
class FeaturedSuccessCarousel extends StatelessWidget {
  const FeaturedSuccessCarousel({super.key, required this.items});

  final List<FeaturedSuccess> items;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return SizedBox(
      height: 248,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: 280,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LuxuryNetworkImage(url: item.imageUrl),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.1),
                            Colors.black.withValues(alpha: 0.72),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    child: GlassSurface(
                      borderRadius: BorderRadius.circular(14),
                      blurSigma: 20,
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.headline,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: text.titleSmall?.copyWith(
                              color: LuxuryDarkTheme.ivory,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.detail,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: text.bodySmall?.copyWith(
                              color: LuxuryDarkTheme.ivoryDim,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
