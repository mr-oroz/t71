import 'package:flutter/material.dart';
import 'package:t71/features/onboarding/presentation/pages/onboarding_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const OnboardingPage(),
    );
  }
}
