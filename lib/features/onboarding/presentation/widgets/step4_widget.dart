import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class Step4Widget extends StatelessWidget {
  const Step4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Positioned(
            left: -size.width * 0.02,
            top: size.height * 0.04,
            child: Image.asset(
              'assets/images/welcome8.png',
              width: size.width,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Text(
              'Complete the basic form to get started fast',
              style: AppFonts.w500f30.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
