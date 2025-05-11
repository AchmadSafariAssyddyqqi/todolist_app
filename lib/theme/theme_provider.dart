// FILE: lib/theme/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  
  // Definisi warna tema
  static const Color lightPrimary = Color(0xFF6200EE);
  static const Color lightAccent = Color(0xFF03DAC6);
  static const Color darkPrimary = Color(0xFFBB86FC);
  static const Color darkAccent = Color(0xFF03DAC6);
  
  // Font styling
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      color: Colors.black87,
    ),
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      color: Colors.white,
    ),
  );

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimary,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: lightPrimary,
      secondary: lightAccent,
    ),
    textTheme: lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: darkPrimary,
      secondary: darkAccent,
      brightness: Brightness.dark,
    ),
    textTheme: darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimary,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[850],
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),
  );

  // Getter untuk theme saat ini
  ThemeData get currentTheme => isDarkMode ? darkTheme : lightTheme;

  // Method untuk toggle tema
  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}