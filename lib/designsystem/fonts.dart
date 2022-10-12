import 'package:flutter/material.dart';

import 'colors.dart';

class DesignSystemFonts {
  static TextStyle textStyleH1(
          {double size = 28.0,
          Color? color,
          double? height,
          double? lineHeight}) =>
      TextStyle(
          fontFamily: 'Gotham',
          fontWeight: FontWeight.bold,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size : height) ?? 1);

  static TextStyle textStyleH2(
          {double size = 22.0,
          Color? color,
          double? height,
          double? lineHeight}) =>
      TextStyle(
          fontFamily: 'Gotham',
          fontWeight: FontWeight.bold,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size : height) ?? 1);

  static TextStyle textStyleH3(
          {double size = 18,
          Color? color,
          double? height,
          double? lineHeight,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: 'Gotham',
          fontWeight: fontWeight,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size : height) ?? 1);

  static TextStyle textStyleH4(
          {double size = 14,
          Color? color,
          double? height,
          double? lineHeight,
          double letterSpacing = 0,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
        fontFamily: 'Gotham',
        fontWeight: fontWeight,
        color: color ?? Palette.charcoal100,
        fontSize: size,
        height: (lineHeight != null ? lineHeight / size : height) ?? 1,
        letterSpacing: letterSpacing,
      );

  static TextStyle textStyleH5(
          {Color? color,
          FontWeight? weight,
          double? size = 12,
          double? lineHeight}) =>
      TextStyle(
          fontFamily: 'Gotham',
          fontWeight: weight ?? FontWeight.bold,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: lineHeight != null ? lineHeight / size! : 1);

  static TextStyle textStylePRegular(
          {String fontFamily = 'Roboto',
          TextDecoration? decoration,
          Color? color,
          double? size = 16,
          double? height,
          double? lineHeight}) =>
      TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.normal,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size! : height) ?? 1,
          decoration: decoration);

  static TextStyle textStylePBold(
          {String fontFamily = 'Roboto',
          Color? color,
          double? size = 16,
          double? height,
          double? lineHeight}) =>
      TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size! : height) ?? 1);

  static TextStyle textStylePUnderline({
    String fontFamily = 'Roboto',
    Color? color,
    double? size = 12,
    double? height,
    double? lineHeight,
  }) =>
      TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: fontFamily,
          color: color ?? Palette.charcoal100,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size! : height) ?? 1);

  static TextStyle textStyleLinks({
    Color? color,
    double size = 16,
    double? height,
    double? lineHeight,
  }) =>
      TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          color: color ?? Palette.charcoal100,
          decoration: TextDecoration.underline,
          fontSize: size,
          height: (lineHeight != null ? lineHeight / size : height) ?? 1);

  static TextStyle textStyleButton(
          {String fontFamily = 'Roboto', Color? color, double size = 14}) =>
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: color ?? Palette.charcoal100,
        fontSize: size,
      );

  static TextStyle textStyleButtonSmall({
    Color? color,
    double? size = 8,
    FontWeight? fontWeight = FontWeight.normal,
  }) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        color: color ?? Palette.charcoal100,
        fontSize: size,
        letterSpacing: 1,
      );

  static TextStyle textStylePrimaryButton({Color? color, double size = 14}) =>
      TextStyle(
        fontFamily: 'Gotham',
        fontWeight: FontWeight.bold,
        color: color ?? Palette.charcoal100,
        fontSize: size,
      );

  static TextStyle textStyleSocialButton({Color? color, double size = 14}) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.normal,
        color: color ?? Palette.charcoal100,
        fontSize: size,
      );
}
