import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF1E1E1E),
    primaryTextTheme: Typography.whiteMountainView,
    accentColor: Color(0xFF00C25F),
    errorColor: Color(0xFFf5c6cb),
    scaffoldBackgroundColor: Color(0xFF191919),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFF00C25F),
      unselectedItemColor: Typography.whiteMountainView.caption.color,
    ),
    cardTheme: CardTheme(
      elevation: 0.0,
      color: Color(0xFF191919),
    ),
    chipTheme: ThemeData.dark().chipTheme.copyWith(
          elevation: 2,
          pressElevation: 4,
          secondarySelectedColor: Color(0xFF37493f),
          selectedShadowColor: Color(0x0000000),
          secondaryLabelStyle:
              ThemeData.light().chipTheme.secondaryLabelStyle.copyWith(
                    color: Color(0xFFa8dab5),
                  ),
          backgroundColor: Color(0xFF222324),
        ),
    textTheme: TextTheme(
      headline6: Typography.whiteMountainView.headline6.copyWith(
        fontSize: 18,
        color: ThemeData.dark().textTheme.headline6.color,
        fontWeight: FontWeight.w600,
      ),
      headline5: Typography.whiteMountainView.headline6.copyWith(
        fontSize: 16,
        color: ThemeData.dark().textTheme.headline6.color,
        fontWeight: FontWeight.w600,
      ),
      caption: Typography.blackMountainView.caption.copyWith(
        fontSize: 14,
        color: ThemeData.dark().textTheme.bodyText1.color,
      ),
    ),
  );
}
