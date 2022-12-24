import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme with ChangeNotifier {
  ThemeData _theme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(color: Colors.black87),
      titleSmall: GoogleFonts.poppins(color: Colors.black54),
    ),
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
    ),
  );
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ThemeData.dark().textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent,elevation: 2,),
    ),
  );
  ThemeData light = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.montserrat(color: Colors.black87),
      titleSmall: GoogleFonts.poppins(color: Colors.black54),
    ),
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
    ),
  );
  ThemeData get theme => _theme;

  void toggler() {
    final isDark = _theme == dark;
    if (isDark) {
      _theme = light;
    } else {
      _theme = dark;
    }
    notifyListeners();
  }
}
