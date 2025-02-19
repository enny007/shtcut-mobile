import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kcPrimaryColor = Color(0xFF2F64E9);
const Color kcTextHeadingColor = Color(0xFF2B2829);
const Color kcTextColor = Color(0xFF5A5555);
const Color kcPrimaryTextColor = Color(0xFF101828);
const Color kcSubHeadingColor = Color(0xFF393B41);
// const Color kcPrimaryColorDark = Color(0xFF300151);
// const Color kcDarkGreyColor = Color(0xFF1A1B1E);
// const Color kcMediumGrey = Color(0xFF474A54);
// const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
// const Color kcVeryLightGrey = Color(0xFFE3E3E3);
// const Color kcBackgroundColor = kcDarkGreyColor;

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: kcPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.all(
          Colors.grey.withValues(alpha: .4),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(
          Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        side: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
            // color: kcSecondaryColor,
            ),
        surfaceTintColor: Colors.transparent,
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Color(0xffF2F4F7),
        // todayBackgroundColor: WidgetStatePropertyAll(kcSecondaryColor),
      ),
      textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          color: kcTextColor,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: kcTextColor,
        ),
        displaySmall: GoogleFonts.plusJakartaSans(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: kcTextColor,
        ),
        bodyLarge: GoogleFonts.plusJakartaSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: kcTextColor,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: kcTextColor,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: kcTextColor,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black.withOpacity(0.5),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xffF2F2F2),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            // color: kcSecondaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: .23),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          // borderSide: const BorderSide(color: kcSecondaryColor),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
        hintStyle: GoogleFonts.plusJakartaSans(color: Colors.grey),
      ),
      colorScheme: const ColorScheme.light(
        primary: kcPrimaryColor,
        surface: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }
}
