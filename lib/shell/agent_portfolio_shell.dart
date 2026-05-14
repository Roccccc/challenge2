import 'package:flutter/material.dart';

import '../screens/agent_home_screen.dart';
import '../screens/expertise_screen.dart';
import '../screens/property_showcase_screen.dart';
import '../screens/stats_dashboard_screen.dart';
import '../theme/luxury_dark_theme.dart';
import '../widgets/glass_bottom_navigation.dart';

/// Modular shell: brand-first tabs + frosted bottom navigation.
class AgentPortfolioShell extends StatefulWidget {
  const AgentPortfolioShell({super.key});

  @override
  State<AgentPortfolioShell> createState() => _AgentPortfolioShellState();
}

class _AgentPortfolioShellState extends State<AgentPortfolioShell> {
  var _index = 0;

  static const _pages = <Widget>[
    AgentHomeScreen(),
    StatsDashboardScreen(),
    PropertyShowcaseScreen(),
    ExpertiseScreen(),
  ];

  double _bottomInset(BuildContext context) {
    final safe = MediaQuery.paddingOf(context).bottom;
    return GlassBottomNavigation.barHeight + 12 + safe + 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LuxuryDarkTheme.charcoal,
      body: Padding(
        padding: EdgeInsets.only(bottom: _bottomInset(context)),
        child: IndexedStack(
          index: _index,
          children: _pages,
        ),
      ),
      bottomNavigationBar: GlassBottomNavigation(
        currentIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}
