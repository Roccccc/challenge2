import 'package:flutter/material.dart';

import '../data/agent_branding.dart';
import '../theme/luxury_dark_theme.dart';
import '../widgets/featured_success_carousel.dart';
import '../widgets/luxury_network_image.dart';

/// Personal brand home: collapsing portrait header, mission, featured wins carousel.
class AgentHomeScreen extends StatelessWidget {
  const AgentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBar(
          expandedHeight: 340,
          pinned: true,
          stretch: true,
          backgroundColor: LuxuryDarkTheme.charcoal,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            centerTitle: false,
            titlePadding: const EdgeInsetsDirectional.only(start: 20, bottom: 18),
            title: Text(
              AgentBranding.agentName,
              style: text.titleLarge?.copyWith(
                color: LuxuryDarkTheme.ivory,
                fontWeight: FontWeight.w700,
                shadows: const [
                  Shadow(color: Colors.black54, blurRadius: 12, offset: Offset(0, 2)),
                ],
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                LuxuryNetworkImage(url: AgentBranding.profileHeroImageUrl),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.25),
                        Colors.black.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 56,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: LuxuryDarkTheme.gold.withValues(alpha: 0.45)),
                          color: LuxuryDarkTheme.charcoal.withValues(alpha: 0.35),
                        ),
                        child: Text(
                          AgentBranding.agentTitle.toUpperCase(),
                          style: text.labelSmall?.copyWith(
                            color: LuxuryDarkTheme.gold,
                            letterSpacing: 1.6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mission statement',
                  style: text.labelLarge?.copyWith(
                    color: LuxuryDarkTheme.gold,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AgentBranding.missionStatement,
                  style: text.bodyLarge?.copyWith(
                    color: LuxuryDarkTheme.ivoryDim,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 0, 10),
            child: Text(
              'Featured successes',
              style: text.titleMedium?.copyWith(
                color: LuxuryDarkTheme.ivory,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: FeaturedSuccessCarousel(items: AgentBranding.featuredSuccesses),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
