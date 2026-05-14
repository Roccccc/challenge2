import 'package:flutter/material.dart';

import '../models/agent_models.dart';
import '../theme/luxury_dark_theme.dart';

/// Vertical stack of recognition cards for the Edge tab (scrolls with parent).
class EstateAwardsCarousel extends StatelessWidget {
  const EstateAwardsCarousel({super.key, required this.awards});

  final List<EstateAward> awards;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        children: [
          for (var i = 0; i < awards.length; i++) ...[
            if (i != 0) const SizedBox(height: 12),
            _AwardCard(award: awards[i], textTheme: text),
          ],
        ],
      ),
    );
  }
}

class _AwardCard extends StatelessWidget {
  const _AwardCard({required this.award, required this.textTheme});

  final EstateAward award;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black.withValues(alpha: 0.45),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    LuxuryDarkTheme.gold.withValues(alpha: 0.35),
                    LuxuryDarkTheme.gold.withValues(alpha: 0.08),
                  ],
                ),
                border: Border.all(
                  color: LuxuryDarkTheme.gold.withValues(alpha: 0.45),
                ),
              ),
              child: const Icon(
                Icons.emoji_events_rounded,
                color: LuxuryDarkTheme.gold,
                size: 26,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    award.year,
                    style: textTheme.labelSmall?.copyWith(
                      color: LuxuryDarkTheme.gold,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    award.title,
                    style: textTheme.titleSmall?.copyWith(
                      color: LuxuryDarkTheme.ivory,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    award.issuer,
                    style: textTheme.bodySmall?.copyWith(
                      color: LuxuryDarkTheme.ivoryDim,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    award.tagline,
                    style: textTheme.bodySmall?.copyWith(
                      color: LuxuryDarkTheme.ivoryDim.withValues(alpha: 0.9),
                      height: 1.35,
                      fontSize: 11,
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
}
