import 'package:flutter/material.dart';

// Spacing Constants
const double _tinySize = 4.0;
const double _smallSize = 8.0;
const double _mediumSize = 16.0;
const double _largeSize = 24.0;
const double _extraLargeSize = 32.0;
const double _hugeSize = 48.0;
const double _massiveSize = 64.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);
const Widget horizontalSpaceExtraLarge = SizedBox(width: _extraLargeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceExtraLarge = SizedBox(height: _extraLargeSize);
const Widget verticalSpaceHuge = SizedBox(height: _hugeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

// Breakpoints
class ResponsiveBreakpoints {
  static const double mobile = 640.0;
  static const double tablet = 1080.0;
  static const double desktop = 1280.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobile;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < tablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet;

  static double getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1320) return (width - 1200) / 2;
    if (width >= 1080) return 36.0;
    if (width >= 768) return 24.0;
    if (width >= 480) return 16.0;
    return 12.0;
  }
}

// Shadows
final List<BoxShadow> kCardShadow = [
  BoxShadow(
    color: const Color(0xFF0F172A).withValues(alpha: 0.04),
    blurRadius: 16,
    offset: const Offset(0, 4),
  ),
  BoxShadow(
    color: const Color(0xFF0F172A).withValues(alpha: 0.02),
    blurRadius: 4,
    offset: const Offset(0, 1),
  ),
];

final List<BoxShadow> kHoverShadow = [
  BoxShadow(
    color: const Color(0xFF059669).withValues(alpha: 0.12),
    blurRadius: 24,
    offset: const Offset(0, 8),
  ),
  BoxShadow(
    color: const Color(0xFF0F172A).withValues(alpha: 0.06),
    blurRadius: 8,
    offset: const Offset(0, 2),
  ),
];

final List<BoxShadow> kGlowShadow = [
  BoxShadow(
    color: const Color(0xFF10B981).withValues(alpha: 0.35),
    blurRadius: 30,
    spreadRadius: 2,
    offset: const Offset(0, 4),
  ),
];
