import '../models/agent_models.dart';

/// Branding copy + Unsplash placeholders (luxury architecture & interiors).
abstract final class AgentBranding {
  static const String agentName = 'Jordan Mercer';
  static const String agentTitle = 'Luxury Real Estate Advisor';
  static const String missionStatement =
      'I represent discerning buyers and sellers who expect discretion, data-backed guidance, '
      'and a calm hand through high-stakes transactions. Your move is personal — your brand experience should be too.';

  /// High-res portrait-style image for the collapsing header.
  static const String profileHeroImageUrl =
      'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&w=1600&q=85';

  static const List<AgentStat> dashboardStats = [
    AgentStat(label: 'Years experience', value: '14', subtitle: 'Across luxury corridors'),
    AgentStat(label: 'Homes sold', value: '186', subtitle: 'Off-market + public'),
    AgentStat(label: 'Avg. days on market', value: '18', subtitle: 'Portfolio average'),
  ];

  static const List<FeaturedSuccess> featuredSuccesses = [
    FeaturedSuccess(
      headline: 'Waterfront closing — 12% above ask',
      detail: 'Private tour funnel + pricing discipline',
      imageUrl:
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=1200&q=80',
    ),
    FeaturedSuccess(
      headline: 'Estate sale in 9 days',
      detail: 'Staging narrative + buyer matching',
      imageUrl:
          'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=1200&q=80',
    ),
    FeaturedSuccess(
      headline: 'Off-market tower duplex',
      detail: 'Quiet matchmaking for principals',
      imageUrl:
          'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1200&q=80',
    ),
    FeaturedSuccess(
      headline: 'Investor repositioning',
      detail: 'Renovation ROI roadmap',
      imageUrl:
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format&fit=crop&w=1200&q=80',
    ),
  ];

  static const List<PropertyListing> showcaseListings = [
    PropertyListing(
      id: 'p1',
      title: 'Skyline Penthouse',
      imageUrl:
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=1200&q=80',
      priceDisplay: '\$4,850,000',
      status: ListingStatus.exclusive,
      neighborhood: 'Yorkville',
      detailLine: '3 bed · 3.5 bath · 3,200 sq ft · 360° views',
    ),
    PropertyListing(
      id: 'p2',
      title: 'Lakeside Modern',
      imageUrl:
          'https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?auto=format&fit=crop&w=1200&q=80',
      priceDisplay: '\$2,195,000',
      status: ListingStatus.sold,
      neighborhood: 'Forest Hill',
      detailLine: '5 bed · 4 bath · Pool · Pier access',
    ),
    PropertyListing(
      id: 'p3',
      title: 'Heritage Row Townhome',
      imageUrl:
          'https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?auto=format&fit=crop&w=1200&q=80',
      priceDisplay: '\$1,675,000',
      status: ListingStatus.active,
      neighborhood: 'Annex',
      detailLine: '4 bed · 3 bath · Rooftop terrace',
    ),
  ];

  static const List<ExpertiseItem> expertiseItems = [
    ExpertiseItem(
      title: 'Luxury estates',
      chips: ['Private previews', 'Estate-caliber staging'],
    ),
    ExpertiseItem(
      title: 'Market analysis',
      chips: ['Hyper-local comps', 'Pricing scenarios'],
    ),
    ExpertiseItem(
      title: 'Investment strategy',
      chips: ['Cap stacks', 'Renovation ROI'],
    ),
    ExpertiseItem(
      title: 'Off-market access',
      chips: ['Quiet inventory', 'Principal matching'],
    ),
    ExpertiseItem(
      title: 'Relocation & second homes',
      chips: ['Concierge move', 'Cross-border timing'],
    ),
    ExpertiseItem(
      title: 'Negotiation architecture',
      chips: ['Multi-party deals', 'Earnest structuring'],
    ),
  ];

  /// Fictional awards for UI demonstration — replace with your real credentials.
  static const List<EstateAward> estateAwards = [
    EstateAward(
      title: "Chairman's Circle — Diamond",
      issuer: 'Greater Toronto Luxury Guild',
      year: '2024',
      tagline: 'Top 1% closed volume, ultra-luxury corridor',
    ),
    EstateAward(
      title: 'North Star Service Excellence',
      issuer: 'Canadian Estate Council',
      year: '2023',
      tagline: 'Principal satisfaction & confidential placement',
    ),
    EstateAward(
      title: 'Luminary Advisor of the Year',
      issuer: 'National Independent Brokers Forum',
      year: '2022',
      tagline: 'Portfolio strategy for multi-property principals',
    ),
    EstateAward(
      title: 'ICEA Outstanding Advisor',
      issuer: 'Institute for Chartered Estate Advisors',
      year: '2025',
      tagline: 'Off-market matchmaking & negotiation architecture',
    ),
  ];
}
