import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/luxury_dark_theme.dart';

typedef DestinationTap = void Function(int index);

/// Frosted bottom bar — pairs with scaffold content that respects bottom inset.
class GlassBottomNavigation extends StatelessWidget {
  const GlassBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final DestinationTap onDestinationSelected;

  static const double barHeight = 72;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    final items = _destinations;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottom),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: LuxuryDarkTheme.charcoalCard.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: LuxuryDarkTheme.gold.withValues(alpha: 0.16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.45),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: SizedBox(
              height: barHeight,
              child: Row(
                children: [
                  for (var i = 0; i < items.length; i++)
                    Expanded(
                      child: _NavCell(
                        item: items[i],
                        selected: i == currentIndex,
                        onTap: () => onDestinationSelected(i),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

const List<_NavItem> _destinations = [
  _NavItem(icon: Icons.person_pin_circle_outlined, label: 'Brand'),
  _NavItem(icon: Icons.insights_outlined, label: 'Stats'),
  _NavItem(icon: Icons.villa_outlined, label: 'Homes'),
  _NavItem(icon: Icons.workspace_premium_outlined, label: 'Edge'),
];

class _NavCell extends StatelessWidget {
  const _NavCell({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? LuxuryDarkTheme.gold : LuxuryDarkTheme.ivoryDim;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: LuxuryDarkTheme.gold.withValues(alpha: 0.12),
        highlightColor: LuxuryDarkTheme.gold.withValues(alpha: 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
