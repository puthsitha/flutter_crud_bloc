import 'package:crud_api/core/theme/src/colors.dart';
import 'package:crud_api/core/theme/src/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const ColorScheme colorSchemeLight = ColorScheme(
  surface: AppColors.white,
  onSurface: AppColors.black,
  //
  primary: AppColors.primary,
  // primaryContainer: Color(0xFFEE3075),
  onPrimary: AppColors.white,
  secondary: AppColors.secondary,
  secondaryContainer: Color(0xFFF7F7F7),
  onSecondary: Color(0xFFF7F7F7),
  //
  error: Color(0xFFF0271B),
  onError: Color(0xFFFFFFFF),
  brightness: Brightness.light,
  //neutrals
);

final colorSchemeLightExt = AppColorScheme(
  primary: AppColors.primary,
  secondary: AppColors.secondary,
  tertiary: AppColors.tertiary,
  primaryText: AppColors.black,
  secondaryText: AppColors.secondaryTextLight,
  neutral0: AppColors.neutral0,
  neutral4: AppColors.neutral4,
  neutral6: AppColors.neutral6,
  neutral10: AppColors.neutral10,
  neutral12: AppColors.neutral12,
  neutral17: AppColors.neutral17,
  neutral20: AppColors.neutral20,
  neutral22: AppColors.neutral22,
  neutral24: AppColors.neutral24,
  neutral30: AppColors.neutral30,
  neutral40: AppColors.neutral40,
  neutral50: AppColors.neutral50,
  neutral60: AppColors.neutral60,
  neutral70: AppColors.neutral70,
  neutral72: AppColors.neutral72,
  neutral80: AppColors.neutral80,
  neutral87: AppColors.neutral87,
  neutral89: AppColors.neutral89,
  neutral90: AppColors.neutral90,
  neutral92: AppColors.neutral92,
  neutral94: AppColors.neutral94,
  neutral95: AppColors.neutral95,
  neutral96: AppColors.neutral96,
  neutral98: AppColors.neutral98,
  neutral100: AppColors.neutral100,
  purpleLight: AppColors.purpleLight,
  purplePrimary: AppColors.purplePrimary,
  purpleDark: AppColors.purpleDark,
  orangeLight: AppColors.orangeLight,
  orangePrimary: AppColors.orangePrimary,
  greenLight: AppColors.greenLight,
  greenPrimary: AppColors.greenPrimary,
  greenDark: AppColors.greenDark,
  transparent: const Color.fromARGB(0, 255, 255, 255),
  darkCyanBlue: AppColors.darkCyanBlue,
  blueLight: AppColors.blueLight,
  greyLight: AppColors.greyLight,
  redPrimary: AppColors.redPrimary,
  greyPrimary: AppColors.greyPrimary,
  greyDark: AppColors.greyDark,
  greySecondary: AppColors.greySecondary,
  processing: AppColors.processing,
  inDelivery: AppColors.inDelivery,
  delivered: AppColors.delivered,
  darkShadeGrey100: AppColors.darkShadeGrey100,
  darkShadeGrey60: AppColors.darkShadeGrey60,
  darkShadeGrey70: AppColors.darkShadeGrey70,
  darkShadeGrey80: AppColors.darkShadeGrey80,
  darkShadeGrey90: AppColors.darkShadeGrey90,
  lightShadeGrey10: AppColors.lightShadeGrey10,
  lightShadeGrey20: AppColors.lightShadeGrey20,
  lightShadeGrey30: AppColors.lightShadeGrey30,
  lightShadeGrey40: AppColors.lightShadeGrey40,
  lightShadeGrey50: AppColors.lightShadeGrey50,
  pureDark: AppColors.pureDark,
  pureWhite: AppColors.pureWhite,
  foodHomeAppBar: AppColors.primary,
);
final lightTheme = ThemeData(
  extensions: [
    colorSchemeLightExt,
    // const FlashToastTheme(),
    // const FlashBarTheme(),
  ],
  useMaterial3: false,
  chipTheme: ChipThemeData(
    secondaryLabelStyle: const TextStyle(
      color: Colors.white,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      fontSize: 12,
    ),
    deleteIconColor: Colors.white,
    backgroundColor: colorSchemeLightExt.primary,
    checkmarkColor: Colors.white,
    labelStyle: const TextStyle(
      color: Colors.white,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      fontSize: 12,
    ),
  ),

  scaffoldBackgroundColor: colorSchemeLightExt.lightShadeGrey10,

  // scaffoldBackgroundColor: colorSchemeLightExt.lightShadeGrey10,

  // scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  dividerTheme: DividerThemeData(
    thickness: 0.5,
    color: colorSchemeLightExt.lightShadeGrey20,
  ),
  textTheme: Typography.material2021().black
      .copyWith(
        displayLarge: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        displayMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        displaySmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        headlineSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Fonts.en,
          fontFamilyFallback: [Fonts.kh],
        ),
      )
      .apply(
        bodyColor: colorSchemeLightExt.primaryText,
        displayColor: colorSchemeLightExt.primaryText,
        fontFamily: Fonts.en,
        fontFamilyFallback: [Fonts.kh, Fonts.en],
      ),
  colorScheme: colorSchemeLight,
  primaryColor: colorSchemeLightExt.primary,
  tabBarTheme: TabBarThemeData(
    indicator: UnderlineTabIndicator(
      borderRadius: BorderRadius.circular(12),
      insets: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      borderSide: BorderSide(
        color: colorSchemeLightExt.primary,
        width: 4,
      ), // Custom height
    ),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      fontFamilyFallback: const [Fonts.kh],
      color: colorSchemeLightExt.pureDark,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      fontFamilyFallback: const [Fonts.kh],
      color: colorSchemeLightExt.darkShadeGrey60,
    ),
  ),
  // primaryColorDark: colorSchemeLightExt.primary900,
  // primaryColorLight: colorSchemeLightExt.primary400,
  datePickerTheme: const DatePickerThemeData(),
  fontFamily: Fonts.en,
  fontFamilyFallback: const [Fonts.kh, Fonts.en],
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: Colors.transparent,
    childrenPadding: const EdgeInsets.all(16),
    iconColor: colorSchemeLightExt.primary,
    textColor: colorSchemeLightExt.primaryText,
    collapsedTextColor: colorSchemeLightExt.primaryText,
    collapsedIconColor: colorSchemeLightExt.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: colorSchemeLightExt.lightShadeGrey50,
      fontFamilyFallback: const [Fonts.en, Fonts.kh],
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    fillColor: Colors.transparent,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        width: 2,
        color: colorSchemeLightExt.primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        width: 2,
        // color: Colors.red,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: colorSchemeLightExt.darkShadeGray60,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0.5,
        // color: AppColors.borderColor,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  // cupertinoOverrideTheme: CupertinoThemeData(textTheme: ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    enableFeedback: false,
    elevation: 1,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: colorSchemeLightExt.darkShadeGrey80,
    selectedIconTheme: const IconThemeData(size: 24),
    unselectedIconTheme: const IconThemeData(size: 24),
    selectedLabelStyle: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
      fontFamily: Fonts.en,
      fontFamilyFallback: [Fonts.kh],
      height: 1.6,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: Fonts.en,
      color: colorSchemeLightExt.neutral30,
      fontFamilyFallback: const [Fonts.kh],
      height: 1.6,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: Fonts.en,
        fontFamilyFallback: [Fonts.kh],
      ),
      shape: const StadiumBorder(),
    ),
  ),
  // outlinedButtonTheme: OutlineBu,
  // actionIconTheme: ActionIconThemeData(
  //   backButtonIconBuilder: (BuildContext context) {
  //     return SvgPicture.asset(
  //       'assets/icons/arrow_left.svg',
  //       // height: 26,
  //       // width: 26,
  //       colorFilter: ColorFilter.mode(
  //         colorSchemeLightExt.pureDark,
  //         BlendMode.srcIn,
  //       ),
  //     );
  //   },
  // ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      padding: const EdgeInsets.all(10),
      iconSize: 20,
      backgroundColor: colorSchemeLight.surface,
      foregroundColor: colorSchemeLight.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamilyFallback: const [Fonts.kh],
      color: colorSchemeLight.onSurface,
      fontFamily: Fonts.en,
    ),
    iconTheme: IconThemeData(
      color: colorSchemeLight.onSurface,
    ),
    elevation: 0,
    backgroundColor: colorSchemeLightExt.lightShadeGrey10,
    actionsIconTheme: IconThemeData(
      size: 24,
      color: colorSchemeLight.onSurface,
    ),
    centerTitle: true,
  ),
);
