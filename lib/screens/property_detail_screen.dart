import 'package:flutter/material.dart';

import '../models/agent_models.dart';
import '../theme/luxury_dark_theme.dart';
import '../widgets/glass_surface.dart';
import '../widgets/luxury_network_image.dart';
import '../widgets/luxury_property_card.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key, required this.listing});

  final PropertyListing listing;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: LuxuryDarkTheme.charcoal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: LuxuryDarkTheme.ivory),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: LuxuryPropertyCard.heroTagFor(listing.id),
            child: Material(
              color: LuxuryDarkTheme.charcoal,
              child: LuxuryNetworkImage(url: listing.imageUrl),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.black.withValues(alpha: 0.05),
                    LuxuryDarkTheme.charcoal.withValues(alpha: 0.92),
                  ],
                  stops: const [0, 0.45, 1],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: GlassSurface(
                  borderRadius: BorderRadius.circular(20),
                  blurSigma: 28,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _MiniBadge(status: listing.status),
                          const Spacer(),
                          Text(
                            listing.neighborhood.toUpperCase(),
                            style: text.labelSmall?.copyWith(
                              color: LuxuryDarkTheme.gold,
                              letterSpacing: 1.4,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        listing.title,
                        style: text.headlineSmall?.copyWith(
                          color: LuxuryDarkTheme.ivory,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        listing.priceDisplay,
                        style: text.titleLarge?.copyWith(
                          color: LuxuryDarkTheme.gold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        listing.detailLine,
                        style: text.bodyMedium?.copyWith(
                          color: LuxuryDarkTheme.ivoryDim,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniBadge extends StatelessWidget {
  const _MiniBadge({required this.status});

  final ListingStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: status.badgeColor.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: LuxuryDarkTheme.gold.withValues(alpha: 0.35)),
      ),
      child: Text(
        status.label,
        style: const TextStyle(
          color: LuxuryDarkTheme.ivory,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.1,
          fontSize: 11,
        ),
      ),
    );
  }
}
