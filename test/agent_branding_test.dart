import 'package:flutter_test/flutter_test.dart';

import 'package:challenge2/data/agent_branding.dart';

void main() {
  test('branding deck includes stats, successes, listings, and specialties', () {
    expect(AgentBranding.agentName, isNotEmpty);
    expect(AgentBranding.dashboardStats, hasLength(3));
    expect(AgentBranding.featuredSuccesses, isNotEmpty);
    expect(AgentBranding.showcaseListings, isNotEmpty);
    expect(AgentBranding.expertiseItems, isNotEmpty);
    expect(AgentBranding.estateAwards, hasLength(4));
  });
}
