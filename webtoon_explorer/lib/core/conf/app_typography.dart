import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';

class AppTypography {
  static TextStyle get heading1 => GoogleFonts.workSans(
        color: AppColors.fontColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get heading2 => GoogleFonts.workSans(
        color: AppColors.fontColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get subHeading1 => GoogleFonts.workSans(
        color: AppColors.fontColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get body1 => GoogleFonts.workSans(
        color: AppColors.fontColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
}
