
import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class Step1Widget extends StatelessWidget {
  const Step1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Positioned(
            right: -size.width * 0.1,
            top: size.height * 0.1,
            child: Image.asset(
              'assets/images/welcome2.png',
              width: size.width * 1.1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: -size.width * 0.1,
            top: size.height * 0,
            child: Image.asset(
              'assets/images/welcome1.png',
              width: size.width * 1.1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Text(
              'Organize your training sessions to achieve better results',
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