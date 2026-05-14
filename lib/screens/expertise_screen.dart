import 'package:flutter/material.dart';

import '../data/agent_branding.dart';
import '../theme/luxury_dark_theme.dart';
import '../widgets/estate_awards_carousel.dart';

/// Edge tab: recognition (awards) + expertise specialties.
class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final items = AgentBranding.expertiseItems;

    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EDGE',
                style: text.labelLarge?.copyWith(
                  color: LuxuryDarkTheme.gold,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Recognition & depth',
                style: text.headlineSmall?.copyWith(
                  color: LuxuryDarkTheme.ivory,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Credentials open doors; judgement keeps them open.',
                style: text.bodyMedium?.copyWith(
                  color: LuxuryDarkTheme.ivoryDim,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recognition',
              style: text.titleMedium?.copyWith(
                color: LuxuryDarkTheme.ivory,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const EstateAwardsCarousel(awards: AgentBranding.estateAwards),
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Text(
            'Expertise',
            style: text.titleMedium?.copyWith(
              color: LuxuryDarkTheme.ivory,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (var i = 0; i < items.length; i++) ...[
          if (i != 0)
            Divider(height: 1, color: LuxuryDarkTheme.ivory.withValues(alpha: 0.06)),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: LuxuryDarkTheme.gold.withValues(alpha: 0.35)),
                color: LuxuryDarkTheme.charcoalCard,
              ),
              child: const Icon(Icons.diamond_outlined, color: LuxuryDarkTheme.gold, size: 22),
            ),
            title: Text(
              items[i].title,
              style: text.titleMedium?.copyWith(
                color: LuxuryDarkTheme.ivory,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  for (final label in items[i].chips) _ExpertChip(label: label),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ExpertChip extends StatelessWidget {
  const _ExpertChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: LuxuryDarkTheme.ivoryDim,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: LuxuryDarkTheme.charcoalElevated,
      side: BorderSide(color: LuxuryDarkTheme.gold.withValues(alpha: 0.2)),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}
