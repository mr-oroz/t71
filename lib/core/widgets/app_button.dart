
import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.height,
    required this.onPressed,
    required this.title,
    required this.bgColor,
    required this.textColor,
  });

  final double height;
  final Function() onPressed;
  final String title;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFonts.w400f16.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}