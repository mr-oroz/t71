
import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class Step2Widget extends StatelessWidget {
  const Step2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Positioned(
            left: -size.width * 0.12,
            top: size.height * 0.12,
            child: Image.asset(
              'assets/images/welcome3.png',
              width: size.width * 1.1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -size.width * 0.02,
            top: size.height * 0.05,
            child: Image.asset(
              'assets/images/welcome4.png',
              width: size.width * 0.7,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -size.width * 0.1,
            bottom: size.height * 0,
            child: Image.asset(
              'assets/images/welcome5.png',
              width: size.width * 1.01,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Text(
              'Gain control over both your physical and mental self',
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