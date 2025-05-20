import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

// LIGHT
TextStyle getPoppinslightStyle18(Color color) =>
    _getTextStyle(FontSize.large, FontWeightManager.light, color);

// REGULAR
TextStyle getPoppinsRegularStyle10(Color color) =>
    _getTextStyle(FontSize.xSmall, FontWeightManager.regular, color);

TextStyle getPoppinsRegularStyle12(Color color) =>
    _getTextStyle(FontSize.caption, FontWeightManager.regular, color);

TextStyle getPoppinsRegularStyle14(Color color) =>
    _getTextStyle(FontSize.small, FontWeightManager.regular, color);

TextStyle getPoppinsRegularStyle16(Color color) =>
    _getTextStyle(FontSize.medium, FontWeightManager.regular, color);

// MEDIUM
TextStyle getPoppinsMediumStyle10(Color color) =>
    _getTextStyle(FontSize.xSmall, FontWeightManager.medium, color);

TextStyle getPoppinsMediumStyle12(Color color) =>
    _getTextStyle(FontSize.caption, FontWeightManager.medium, color);

TextStyle getPoppinsMediumStyle14(Color color) =>
    _getTextStyle(FontSize.small, FontWeightManager.medium, color);

TextStyle getPoppinsMediumStyle16(Color color) =>
    _getTextStyle(FontSize.medium, FontWeightManager.medium, color);

TextStyle getPoppinsMediumStyle18(Color color) =>
    _getTextStyle(FontSize.large, FontWeightManager.medium, color);

TextStyle getPoppinsMediumStyle32(Color color) =>
    _getTextStyle(FontSize.display, FontWeightManager.medium, color);

// SEMIBOLD
TextStyle getPoppinsSemiBoldStyle14(Color color) =>
    _getTextStyle(FontSize.small, FontWeightManager.semiBold, color);

TextStyle getPoppinsSemiBoldStyle16(Color color) =>
    _getTextStyle(FontSize.medium, FontWeightManager.semiBold, color);

TextStyle getPoppinsSemiBoldStyle18(Color color) =>
    _getTextStyle(FontSize.large, FontWeightManager.semiBold, color);

TextStyle getPoppinsSemiBoldStyle20(Color color) =>
    _getTextStyle(FontSize.title, FontWeightManager.semiBold, color);

// BOLD
TextStyle getPoppinsBoldStyle20(Color color) =>
    _getTextStyle(FontSize.title, FontWeightManager.bold, color);

TextStyle getPoppinsBoldStyle24(Color color) =>
    _getTextStyle(FontSize.headline, FontWeightManager.bold, color);

// EXTRABOLD
TextStyle getPoppinsExtraBoldStyle32(Color color) =>
    _getTextStyle(FontSize.display, FontWeightManager.extraBold, color);
