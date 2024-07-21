import 'package:flutter/material.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/features/add_game/presentation/pages/add_game_page.dart';
import 'package:t71/features/create_profile/presentation/pages/create_profile_page.dart';
import 'package:t71/features/create_profile/presentation/providers/create_profile_provider.dart';
import 'package:t71/features/main/main_page.dart';
import 'package:t71/features/onboarding/presentation/pages/onboarding_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.back,
      ),
      home: MainPage(),
    );
  }
}
