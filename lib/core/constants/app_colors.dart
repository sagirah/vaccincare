import 'package:flutter/material.dart';

/// Pan-African Clinical Health & Immunisation Design System Colors
class AppColors {
  // Brand Anchors & Primary
  static const Color primary = Color(0xFF4522B8);
  static const Color primaryDark = Color(0xFF2E0095);
  static const Color primaryDeep = Color(0xFF29116F);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF4522B8);
  static const Color onPrimaryContainer = Color(0xFFB5A7FF);

  // Secondary & Accents
  static const Color secondary = Color(0xFF6250AA);
  static const Color secondaryContainer = Color(0xFFB09EFE);
  static const Color onSecondaryContainer = Color(0xFF423088);
  static const Color secondaryFixed = Color(0xFFE6DEFF);

  // Canvas & Surfaces
  static const Color background = Color(0xFFF8F6FF);
  static const Color surface = Color(0xFFFDF8FF);
  static const Color surfaceLowest = Color(0xFFFFFFFF);
  static const Color surfaceLow = Color(0xFFF7F1FF);
  static const Color surfaceContainer = Color(0xFFF1EBFF);
  static const Color surfaceContainerLow = Color(0xFFF7F1FF);
  static const Color surfaceContainerHigh = Color(0xFFEBE5FF);
  static const Color surfaceContainerHighest = Color(0xFFE5DEFF);
  static const Color surfaceDim = Color(0xFFDDD5FF);

  // Text & Content Hierarchy
  static const Color onSurface = Color(0xFF1C163C);
  static const Color onSurfaceVariant = Color(0xFF484554);
  static const Color textNavy = Color(0xFF201A40);
  static const Color textSlate = Color(0xFF77738E);

  // Clinical Semantic States: Success & Mint Trust
  static const Color inStockGreen = Color(0xFF149B78);
  static const Color inStockMintBg = Color(0xFFE8F7F1);
  static const Color tertiary = Color(0xFF003628);
  static const Color tertiaryContainer = Color(0xFF004F3B);
  static const Color tertiaryFixed = Color(0xFF85F7CF);
  static const Color tertiaryFixedDim = Color(0xFF68DBB4);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFF51C6A0);

  // Clinical Semantic States: Warning & Alert
  static const Color warningAmber = Color(0xFFE6A23C);
  static const Color warningAmberBg = Color(0xFFFEF7ED);
  static const Color errorRed = Color(0xFFBA1A1A);
  static const Color errorRedAccent = Color(0xFFD94A5A);
  static const Color errorRedBg = Color(0xFFFFDAD6);

  // Outlines & Borders
  static const Color outline = Color(0xFF797586);
  static const Color outlineVariant = Color(0xFFC9C4D7);
  static const Color borderSubtle = Color(0x0F4522B8);

  // Royal Purple Splash & Hero Gradient
  static const LinearGradient heroPurpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF4522B8),
      Color(0xFF37199C),
      Color(0xFF200B63),
    ],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF210959),
      Color(0xFF2C1074),
      Color(0xFF1C0847),
    ],
  );

  static const LinearGradient subtleCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFDF8FF),
      Color(0xFFF1EBFF),
    ],
  );
}
