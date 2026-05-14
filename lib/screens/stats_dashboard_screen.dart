import 'package:flutter/material.dart';

import '../data/agent_branding.dart';
import '../models/agent_models.dart';
import '../theme/luxury_dark_theme.dart';

/// Credibility metrics as elevated cards (subtle elevation + gold rim).
class StatsDashboardScreen extends StatelessWidget {
  const StatsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final stats = AgentBranding.dashboardStats;

    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 720;
        final child = wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < stats.length; i++) ...[
                    Expanded(child: _StatCard(stat: stats[i], textTheme: text)),
                    if (i != stats.length - 1) const SizedBox(width: 16),
                  ],
                ],
              )
            : Column(
                children: [
                  for (var i = 0; i < stats.length; i++) ...[
                    _StatCard(stat: stats[i], textTheme: text),
                    if (i != stats.length - 1) const SizedBox(height: 14),
                  ],
                ],
              );

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Performance snapshot',
                style: text.headlineSmall?.copyWith(
                  color: LuxuryDarkTheme.ivory,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Numbers support the narrative — they never replace it.',
                style: text.bodyMedium?.copyWith(color: LuxuryDarkTheme.ivoryDim, height: 1.45),
              ),
              const SizedBox(height: 24),
              child,
            ],
          ),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.stat, required this.textTheme});

  final AgentStat stat;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black.withValues(alpha: 0.55),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stat.label.toUpperCase(),
              style: textTheme.labelSmall?.copyWith(
                color: LuxuryDarkTheme.gold,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              stat.value,
              style: textTheme.displaySmall?.copyWith(
                color: LuxuryDarkTheme.ivory,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            if (stat.subtitle != null) ...[
              const SizedBox(height: 10),
              Text(
                stat.subtitle!,
                style: textTheme.bodySmall?.copyWith(
                  color: LuxuryDarkTheme.ivoryDim,
                  height: 1.35,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
