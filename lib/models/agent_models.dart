import 'package:flutter/material.dart';

enum ListingStatus { sold, exclusive, active }

extension ListingStatusX on ListingStatus {
  String get label => switch (this) {
        ListingStatus.sold => 'SOLD',
        ListingStatus.exclusive => 'EXCLUSIVE',
        ListingStatus.active => 'ACTIVE',
      };

  Color get badgeColor => switch (this) {
        ListingStatus.sold => const Color(0xFF8B2942),
        ListingStatus.exclusive => const Color(0xFF2A4A6B),
        ListingStatus.active => const Color(0xFF2F6F4F),
      };
}

@immutable
class PropertyListing {
  const PropertyListing({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.priceDisplay,
    required this.status,
    required this.neighborhood,
    required this.detailLine,
  });

  final String id;
  final String title;
  final String imageUrl;
  final String priceDisplay;
  final ListingStatus status;
  final String neighborhood;
  final String detailLine;
}

@immutable
class AgentStat {
  const AgentStat({
    required this.label,
    required this.value,
    this.subtitle,
  });

  final String label;
  final String value;
  final String? subtitle;
}

@immutable
class FeaturedSuccess {
  const FeaturedSuccess({
    required this.headline,
    required this.detail,
    required this.imageUrl,
  });

  final String headline;
  final String detail;
  final String imageUrl;
}

/// Single row in the Edge / Expertise list with tailored signal chips.
@immutable
class ExpertiseItem {
  const ExpertiseItem({
    required this.title,
    required this.chips,
  });

  final String title;
  final List<String> chips;
}

/// Industry-style recognition (sample copy for portfolio demonstration).
@immutable
class EstateAward {
  const EstateAward({
    required this.title,
    required this.issuer,
    required this.year,
    required this.tagline,
  });

  final String title;
  final String issuer;
  final String year;
  final String tagline;
}
