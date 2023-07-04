import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_tracker/configs/font_manager.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: LightModeColors.primaryColor,
    dialogBackgroundColor: LightModeColors.primaryBackground,
    scaffoldBackgroundColor: LightModeColors.primaryBackground,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: LightModeColors.primaryText),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
      fontFamily: 'SFProText',
      bodyColor: LightModeColors.primaryText,
      displayColor: LightModeColors.primaryText,
    ),
    colorScheme: ColorScheme.light(
      primary: LightModeColors.primaryColor,
      secondary: LightModeColors.secondaryColor,
      error: LightModeColors.errorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: LightModeColors.primaryBackground,
        selectedItemColor: LightModeColors.primaryText.withOpacity(0.7),
        unselectedItemColor: LightModeColors.primaryText.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: LightModeColors.primaryColor),
        showUnselectedLabels: true),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(GeneralColors.primaryBtnText),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor.withOpacity(0.4);
        }
        return null;
      }),
    ),
    disabledColor: LightModeColors.disabledColor,
    highlightColor: LightModeColors.selectionColor,
    dividerColor: LightModeColors.dividerColor,
    dividerTheme: DividerThemeData(
      color: LightModeColors.dividerColor,
      thickness: 1.0,
      space: 1.0,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: DarkModeColors.primaryColor,
    dialogBackgroundColor: DarkModeColors.primaryBackground,
    scaffoldBackgroundColor: DarkModeColors.primaryBackground,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: DarkModeColors.primaryText),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
        fontFamily: 'SFProText',
        bodyColor: DarkModeColors.primaryText,
        displayColor: DarkModeColors.primaryText),
    colorScheme: ColorScheme.dark(
      primary: DarkModeColors.primaryColor,
      secondary: DarkModeColors.secondaryColor,
      error: DarkModeColors.errorColor,
      surface: DarkModeColors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: DarkModeColors.primaryBackground,
        selectedItemColor: DarkModeColors.primaryText.withOpacity(0.7),
        unselectedItemColor: DarkModeColors.primaryText.withOpacity(0.32),
        selectedIconTheme: IconThemeData(color: DarkModeColors.primaryColor),
        showUnselectedLabels: true),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(GeneralColors.primaryBtnText),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return GeneralColors.primaryColor.withOpacity(0.4);
        }
        return null;
      }),
    ),
    disabledColor: DarkModeColors.disabledColor,
    highlightColor: DarkModeColors.selectionColor,
    dividerColor: DarkModeColors.dividerColor,
    dividerTheme: DividerThemeData(
      color: DarkModeColors.dividerColor,
      thickness: 1.0,
    ),
  );
}

class LightModeColors implements GeneralColors {
  static Color primaryColor = GeneralColors.primaryColor;
  static Color secondaryColor = GeneralColors.secondaryColor;
  static Color tertiaryColor = GeneralColors.tertiaryColor;
  static Color alternate = GeneralColors.alternate;
  static Color primaryBackground = const Color(0xFFFFFFFF);
  static Color secondaryBackground = const Color(0xFFFFFFFF);
  static Color primaryText = const Color(0xFF1C1243);
  static Color secondaryText = const Color(0xFF57636C);

  static Color primaryBtnText = GeneralColors.primaryBtnText;
  static Color lineColor = const Color(0xFFE0E3E7);

  static Color errorColor = GeneralColors.errorColor;

  static Color imageBackground = GeneralColors.grey20;
  static Color disabledColor = GeneralColors.neutral2;
  static Color selectionColor = GeneralColors.neutral4;
  static Color dividerColor = GeneralColors.grey30;
}

class DarkModeColors implements GeneralColors {
  static Color primaryColor = GeneralColors.primaryColor;
  static Color secondaryColor = GeneralColors.secondaryColor;
  static Color tertiaryColor = GeneralColors.tertiaryColor;
  static Color alternate = GeneralColors.alternate;
  static Color primaryBackground = const Color(0xFF1C1243);
  static Color secondaryBackground = const Color(0xFF101213);
  static Color primaryText = const Color(0xFFF5FCF9);
  static Color secondaryText = const Color(0xFF95A1AC);

  static Color primaryBtnText = GeneralColors.primaryBtnText;
  static Color lineColor = const Color(0xFF22282F);

  static Color errorColor = GeneralColors.errorColor;
  static Color disabledColor = GeneralColors.neutral2;
  static Color selectionColor = GeneralColors.grey40;
  static Color dividerColor = GeneralColors.grey30;
}

class GeneralColors {
  static Color primaryColor = const Color(0xFFFF592C);
  static Color secondaryColor = const Color(0xFF20D090);
  static Color tertiaryColor = const Color(0xFFEE8B60);
  static Color alternate = const Color(0xFFFF5963);
  static Color primaryBtnText = const Color(0xFFFFFFFF);
  static Color errorColor = const Color(0xFFB3261E);

  static Color neutral2 = const Color(0xFFA29EB6);
  static Color neutral3 = const Color(0xFFEFF1F3);
  static Color neutral4 = const Color(0xFFF4F5F6);

  static Color grey10 = const Color(0xFFFAFAFA);
  static Color grey20 = const Color(0xFFD0D0D0);
  static Color grey30 = const Color(0xFFDADADA);
  static Color grey40 = const Color(0xFFD9D9D9);
  static Color grey50 = const Color(0xFF9E9E9E);
}

const appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 1,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(
      fontFamily: FontManager.sFProText,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ));
