import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorExtension on BuildContext {
  // ColorScheme
  Color get colorSchemePrimary => theme.colorScheme.primary;
  Color get colorSchemePrimaryVariant => theme.colorScheme.primaryVariant;
  Color get colorSchemeSecondary => theme.colorScheme.secondary;
  Color get colorSchemeSecondaryVariant => theme.colorScheme.secondaryVariant;
  Color get colorSchemeSurface => theme.colorScheme.surface;
  Color get colorSchemeBackground => theme.colorScheme.background;
  Color get colorSchemeError => theme.colorScheme.error;
  Color get colorSchemeOnPrimary => theme.colorScheme.onPrimary;
  Color get colorSchemeOnSecondary => theme.colorScheme.onSecondary;
  Color get colorSchemeOnSurface => theme.colorScheme.onSurface;
  Color get colorSchemeOnBackground => theme.colorScheme.onBackground;
  Color get colorSchemeOnError => theme.colorScheme.onError;

  // Colors
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => theme.accentColor;
  Color get errorColor => theme.errorColor;

  // Opacity
  Color greywithOpacity(double opacity) =>
      colorSchemeSurface.withOpacity(opacity);
  Color blackWithOpacity(double opacity) =>
      scaffoldBackgroundColor.withOpacity(opacity);
  Color whiteWithOpacity(double opacity) =>
      colorSchemePrimary.withOpacity(opacity);
}
