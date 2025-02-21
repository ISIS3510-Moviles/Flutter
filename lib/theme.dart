import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff9d3900),
      surfaceTint: Color(0xffa53d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc54a00),
      onPrimaryContainer: Color(0xfffff6f4),
      secondary: Color(0xff765b00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffcb34),
      onSecondaryContainer: Color(0xff705600),
      tertiary: Color(0xff7e5700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe5a100),
      onTertiaryContainer: Color(0xff593c00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff4e4541),
      outline: Color(0xff807571),
      outlineVariant: Color(0xffd2c3bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb597),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff360f00),
      primaryFixedDim: Color(0xffffb597),
      onPrimaryFixedVariant: Color(0xff7e2c00),
      secondaryFixed: Color(0xffffdf94),
      onSecondaryFixed: Color(0xff251a00),
      secondaryFixedDim: Color(0xfff2c027),
      onSecondaryFixedVariant: Color(0xff594400),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffffba36),
      onTertiaryFixedVariant: Color(0xff5f4100),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff622100),
      surfaceTint: Color(0xffa53d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbd4700),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff453400),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff886900),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4a3200),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff916500),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff111111),
      onSurfaceVariant: Color(0xff3d3431),
      outline: Color(0xff5b504d),
      outlineVariant: Color(0xff766b67),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb597),
      primaryFixed: Color(0xffbd4700),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff953600),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff886900),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6a5100),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff916500),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff724e00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c5),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffdfdcdb),
      surfaceContainerHighest: Color(0xffd4d1d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff521a00),
      surfaceTint: Color(0xffa53d00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff822e00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff392a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5c4600),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d2800),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff634300),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff332a27),
      outlineVariant: Color(0xff514744),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffffb597),
      primaryFixed: Color(0xff822e00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5c1f00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5c4600),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff413000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff634300),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff452e00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b7),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0ef),
      surfaceContainer: Color(0xffe5e2e1),
      surfaceContainerHigh: Color(0xffd7d4d3),
      surfaceContainerHighest: Color(0xffc9c6c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb597),
      surfaceTint: Color(0xffffb597),
      onPrimary: Color(0xff591d00),
      primaryContainer: Color(0xffc54a00),
      onPrimaryContainer: Color(0xfffff6f4),
      secondary: Color(0xffffecc6),
      onSecondary: Color(0xff3e2e00),
      secondaryContainer: Color(0xffffcb34),
      onSecondaryContainer: Color(0xff705600),
      tertiary: Color(0xffffbe46),
      onTertiary: Color(0xff432c00),
      tertiaryContainer: Color(0xffe5a100),
      onTertiaryContainer: Color(0xff593c00),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffd2c3bf),
      outline: Color(0xff9b8e8a),
      outlineVariant: Color(0xff4e4541),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xffa53d00),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff360f00),
      primaryFixedDim: Color(0xffffb597),
      onPrimaryFixedVariant: Color(0xff7e2c00),
      secondaryFixed: Color(0xffffdf94),
      onSecondaryFixed: Color(0xff251a00),
      secondaryFixedDim: Color(0xfff2c027),
      onSecondaryFixedVariant: Color(0xff594400),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffffba36),
      onTertiaryFixedVariant: Color(0xff5f4100),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3c2),
      surfaceTint: Color(0xffffb597),
      onPrimary: Color(0xff471600),
      primaryContainer: Color(0xffee6725),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffecc6),
      onSecondary: Color(0xff3e2e00),
      secondaryContainer: Color(0xffffcb34),
      onSecondaryContainer: Color(0xff4e3b00),
      tertiary: Color(0xffffd697),
      onTertiary: Color(0xff352200),
      tertiaryContainer: Color(0xffe5a100),
      onTertiaryContainer: Color(0xff312000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe8d9d4),
      outline: Color(0xffbdafaa),
      outlineVariant: Color(0xff9a8e89),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff802d00),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff250800),
      primaryFixedDim: Color(0xffffb597),
      onPrimaryFixedVariant: Color(0xff622100),
      secondaryFixed: Color(0xffffdf94),
      onSecondaryFixed: Color(0xff181000),
      secondaryFixedDim: Color(0xfff2c027),
      onSecondaryFixedVariant: Color(0xff453400),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffffba36),
      onTertiaryFixedVariant: Color(0xff4a3200),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff454444),
      surfaceContainerLowest: Color(0xff070707),
      surfaceContainerLow: Color(0xff1e1d1d),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333232),
      surfaceContainerHighest: Color(0xff3e3d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece6),
      surfaceTint: Color(0xffffb597),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb08f),
      onPrimaryContainer: Color(0xff1b0500),
      secondary: Color(0xffffeecd),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffcb34),
      onSecondaryContainer: Color(0xff271c00),
      tertiary: Color(0xffffedd7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffdb524),
      onTertiaryContainer: Color(0xff130900),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffcede8),
      outlineVariant: Color(0xffcec0bb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff802d00),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb597),
      onPrimaryFixedVariant: Color(0xff250800),
      secondaryFixed: Color(0xffffdf94),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfff2c027),
      onSecondaryFixedVariant: Color(0xff181000),
      tertiaryFixed: Color(0xffffdeac),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffba36),
      onTertiaryFixedVariant: Color(0xff1a0f00),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff51504f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f1f),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff474646),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
