# Luxury Real Estate Agent Portfolio (Flutter)

High-end **personal branding** portfolio for a real estate professional: dark luxury theme (charcoal + gold), glass navigation, collapsing hero portrait on the home screen, stats dashboard, property showcase with **Hero** transitions, and an expertise list.

## Structure

| Path | Role |
|------|------|
| `lib/main.dart` | `EstateAgentPortfolioApp`, theme wiring |
| `lib/theme/luxury_dark_theme.dart` | Charcoal / gold Material 3 theme |
| `lib/data/agent_branding.dart` | Copy + **Unsplash** image URLs |
| `lib/models/agent_models.dart` | `PropertyListing`, `AgentStat`, `FeaturedSuccess`, `ListingStatus` |
| `lib/shell/agent_portfolio_shell.dart` | Tab shell + bottom inset for glass bar |
| `lib/screens/agent_home_screen.dart` | `CustomScrollView` + `SliverAppBar` + mission + carousel |
| `lib/screens/stats_dashboard_screen.dart` | Experience / sold / DOM cards |
| `lib/screens/property_showcase_screen.dart` | Listing feed |
| `lib/screens/property_detail_screen.dart` | Full-bleed Hero destination |
| `lib/screens/expertise_screen.dart` | Specialties as `ListTile` + chips |
| `lib/widgets/glass_surface.dart` | Reusable `BackdropFilter` glass panel |
| `lib/widgets/glass_bottom_navigation.dart` | Frosted bottom bar |
| `lib/widgets/luxury_property_card.dart` | Property card + badge + glass overlay |
| `lib/widgets/luxury_network_image.dart` | Network image + loading / error fallback |
| `lib/widgets/featured_success_carousel.dart` | Horizontal featured wins |

## Run

```bash
cd /Users/roc/Desktop/MP/Challenge2
flutter pub get
flutter run
```

Images load from **Unsplash** over HTTPS; macOS sandbox includes outbound network for debug/release entitlements.

## Tests

```bash
flutter test
```
