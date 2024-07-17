import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t71/core/theme/app_colors.dart';

abstract class AppFonts {
  static TextStyle w400f13 = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w400, color: AppColors.text);
  static TextStyle w400f14 = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.text);
  static TextStyle w400f16 = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.text);
  static TextStyle w500f20 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.text);
  static TextStyle w500f30 = GoogleFonts.poppins(
      fontSize: 30, fontWeight: FontWeight.w500, color: AppColors.text);
  static TextStyle w400f30 = GoogleFonts.poppins(
      fontSize: 30, fontWeight: FontWeight.w400, color: AppColors.text);
  static TextStyle w500f24 = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.text);
  static TextStyle w400f20 = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.text);
}
