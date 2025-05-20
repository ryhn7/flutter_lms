import 'package:flutter/material.dart';

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;        // Optional
  static const FontWeight regular = FontWeight.w400;      // Common body text
  static const FontWeight medium = FontWeight.w500;       // Buttons, captions
  static const FontWeight semiBold = FontWeight.w600;     // Subheadings
  static const FontWeight bold = FontWeight.w700;         // Titles, headings
  static const FontWeight extraBold = FontWeight.w800;    // Rare use
}

class FontSize {
  static const double xSmall = 10.0;      // Optional
  static const double caption = 12.0;     // Captions, helper
  static const double small = 14.0;       // Body 2
  static const double medium = 16.0;      // Body 1 (default)
  static const double large = 18.0;       // Subtitle
  static const double title = 20.0;       // Title
  static const double headline = 24.0;    // Headline
  static const double display = 32.0;     // Hero / display
}
