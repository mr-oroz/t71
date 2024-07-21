
import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLines,
    required this.hintText,
    this.type,
  });

  final TextEditingController controller;
  final int? maxLines;
  final String hintText;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value != null) {
          return 'error';
        }
        return null;
      },
      controller: controller,
      maxLines: maxLines ?? 1,
      style: AppFonts.w400f14.copyWith(
        color: AppColors.text2,
      ),
      keyboardType: type ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: AppColors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}