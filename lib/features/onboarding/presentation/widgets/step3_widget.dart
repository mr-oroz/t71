import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class Step3Widget extends StatelessWidget {
  const Step3Widget({super.key});

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
              'assets/images/welcome6.png',
              width: size.width * 0.77,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            left: -size.width * 0.003,
            top: size.height * 0.1,
            child: Image.asset(
              'assets/images/welcome7.png',
              width: size.width * 1.03,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Text(
              'Transform your gaming world with our distinctive new app',
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
