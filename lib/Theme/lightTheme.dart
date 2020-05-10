import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: Color(0xFFFEFFFF),
    primaryTextTheme: Typography.blackMountainView,
    accentColor: Color(0xFF00C25F),
    errorColor: Color(0xFFd83328),
    scaffoldBackgroundColor: Color(0xFFFEFFFF),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFEFFFF),
      selectedItemColor: Color(0xFF00C25F),
      unselectedItemColor: Typography.blackMountainView.caption.color,
    ),
    cardTheme: CardTheme(
      elevation: 0.0,
      color: Color(0xFFFEFFFF),
    ),
    // indicatorColor: Color(0xFF00C25F),
    chipTheme: ThemeData.light().chipTheme.copyWith(
          elevation: 2,
          pressElevation: 4,
          secondarySelectedColor: Color(0xFFe4f5e9),
          selectedShadowColor: Color(0x0000000),
          secondaryLabelStyle:
              ThemeData.light().chipTheme.secondaryLabelStyle.copyWith(
                    color: Color(0xFF0e8038),
                  ),
          backgroundColor: Color(0xFFFEFFFF),
        ),
    textTheme: TextTheme(
      headline6: Typography.blackMountainView.headline6.copyWith(
        fontSize: 18,
        color: ThemeData.light().textTheme.headline6.color,
        fontWeight: FontWeight.w600,
      ),
      headline5: Typography.blackMountainView.headline5.copyWith(
        fontSize: 16,
        color: ThemeData.light().textTheme.headline6.color,
        fontWeight: FontWeight.w600,
      ),
      caption: Typography.blackMountainView.caption.copyWith(
        fontSize: 14,
        color: ThemeData.light().textTheme.bodyText1.color,
      ),
    ),
  );
}
