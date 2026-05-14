import 'package:flutter/material.dart';

import 'shell/agent_portfolio_shell.dart';
import 'theme/luxury_dark_theme.dart';

void main() {
  runApp(const EstateAgentPortfolioApp());
}

/// High-end luxury real estate agent portfolio (personal brand first).
class EstateAgentPortfolioApp extends StatelessWidget {
  const EstateAgentPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxury Estate Portfolio',
      debugShowCheckedModeBanner: false,
      theme: LuxuryDarkTheme.build(),
      home: const AgentPortfolioShell(),
    );
  }
}
