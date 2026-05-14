import 'package:flutter/material.dart';

import '../data/agent_branding.dart';
import '../theme/luxury_dark_theme.dart';
import '../widgets/luxury_property_card.dart';
import 'property_detail_screen.dart';

class PropertyShowcaseScreen extends StatelessWidget {
  const PropertyShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final listings = AgentBranding.showcaseListings;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      children: [
        Text(
          'Signature properties',
          style: text.headlineSmall?.copyWith(
            color: LuxuryDarkTheme.ivory,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Curated highlights — each card uses a shared Hero tag into the detail view.',
          style: text.bodyMedium?.copyWith(color: LuxuryDarkTheme.ivoryDim, height: 1.45),
        ),
        const SizedBox(height: 20),
        for (final listing in listings)
          LuxuryPropertyCard(
            listing: listing,
            onOpenDetail: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => PropertyDetailScreen(listing: listing),
                ),
              );
            },
          ),
      ],
    );
  }
}
