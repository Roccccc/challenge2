import 'package:flutter/material.dart';

import '../models/agent_models.dart';
import '../theme/luxury_dark_theme.dart';
import 'glass_surface.dart';
import 'luxury_network_image.dart';

class LuxuryPropertyCard extends StatelessWidget {
  const LuxuryPropertyCard({
    super.key,
    required this.listing,
    required this.onOpenDetail,
  });

  final PropertyListing listing;
  final VoidCallback onOpenDetail;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onOpenDetail,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: LuxuryPropertyCard.heroTagFor(listing.id),
                    child: Material(
                      color: Colors.transparent,
                      child: LuxuryNetworkImage(
                        url: listing.imageUrl,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: _StatusBadge(status: listing.status),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GlassSurface(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                      blurSigma: 26,
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  listing.priceDisplay,
                                  style: text.titleLarge?.copyWith(
                                    color: LuxuryDarkTheme.ivory,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_outward_rounded,
                                color: LuxuryDarkTheme.gold.withValues(alpha: 0.85),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${listing.title} · ${listing.neighborhood}',
                            style: text.bodyMedium?.copyWith(
                              color: LuxuryDarkTheme.ivoryDim,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            listing.detailLine,
                            style: text.bodySmall?.copyWith(
                              color: LuxuryDarkTheme.ivoryDim.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String heroTagFor(String id) => 'luxury-listing-$id';
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final ListingStatus status;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: status.badgeColor.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: LuxuryDarkTheme.gold.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          status.label,
          style: const TextStyle(
            color: LuxuryDarkTheme.ivory,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
